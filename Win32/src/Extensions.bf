using System;
using System.Reflection;

namespace System.Interop
{
	extension FlexibleArray<T> where T : struct, new
	{
		/// Initialize for reading
		public this(T* ptr, int count)
		{
			mVal = ptr;
			mCount = (.)count;
		}
	}
	
	[AttributeUsage(.Struct, .DisallowAllowMultiple)]
	struct FlexibleArrayAttribute : Attribute, IOnTypeInit
	{
		String mName;

		public this(String name)
		{
			mName = name;
		}

		public this(params Span<String> names)
		{
			mName = new String();
			for (var name in names)
			{
				if (!mName.IsEmpty)
					mName.Append("\n");
				mName.Append(name);
			}
		}

		[Comptime]
		public void OnTypeInit(Type type, Self* prev)
		{
			if (type.IsGenericParam)
				return;
			var field = type.GetField(type.FieldCount - 1).GetValueOrDefault();
			if (field.FieldType?.IsUnion == true)
			{
				int diff = 0;
				for (var unionField in field.FieldType.GetFields(.Instance))
					diff++;
				for (var names in mName.Split('\n'))
					diff--;
				if (diff != 0)
					Runtime.FatalError("Incorrect number of names specified");

				var nameItr = mName.Split('\n');
				for (var unionField in field.FieldType.GetFields(.Instance))
				{
					var name = nameItr.GetNext().Value;
					if ((!unionField.FieldType.IsSizedArray) || (unionField.FieldType.Size != 0))
						Runtime.FatalError(scope $"Union field '{unionField.Name}' must be a zero-sized array");
					var elementType = (unionField.FieldType as SizedArrayType).UnderlyingType;
					Compiler.Align(type, elementType.Align);
					Compiler.EmitTypeBody(type, scope $"""
						public {elementType}* {name} mut => (({elementType}*)((uint8*)&this + typeof(Self).Size));
						public static int GetAllocSize_{name}(int arrayCount) => typeof(Self).Size + typeof({elementType}).Size*arrayCount;

						""");
				}
			}
			else
			{
				if (mName.Contains('\n'))
					Runtime.FatalError("Only a single accessor name expected");
				if ((field.FieldType == null) || (!field.FieldType.IsSizedArray) || (field.FieldType.Size != 0))
					Runtime.FatalError("Type must end in a zero-sized array");
				var elementType = (field.FieldType as SizedArrayType).UnderlyingType;
				Compiler.Align(type, elementType.Align);
				Compiler.EmitTypeBody(type, scope $"""
					public {elementType}* {mName} mut => (({elementType}*)((uint8*)&this + typeof(Self).Size));
					public static int GetAllocSize(int arrayCount) => typeof(Self).Size + typeof({elementType}).Size*arrayCount;
					""");
			}
		}
	}
}