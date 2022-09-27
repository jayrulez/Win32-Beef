namespace Win32
{
	using Win32.Foundation;
	using Win32.System.Diagnostics.Debug;
	using System;

	public static
	{
		public const uint ANYSIZE_ARRAY = 1;
		public const uint32 FALSE = 0;
		public const uint32 TRUE = 1;

		public static bool SUCCEEDED(HRESULT hr)
		{
			return hr >= 0;
		}

		public static bool FAILED(HRESULT hr)
		{
			return hr < 0;
		}

		public static HRESULT HRESULT_FROM_WIN32(uint64 win32Error)
		{
			return (HRESULT)(win32Error) <= 0 ? (HRESULT)(win32Error) : (HRESULT)(((win32Error) & 0x0000FFFF) | ((uint32)FACILITY_CODE.FACILITY_WIN32 << 16) | 0x80000000);
		}

		public static mixin FOURCC(char8 ch0, char8 ch1, char8 ch2, char8 ch3)
		{
			((uint32)(uint8)(ch0) | ((uint32)(uint8)(ch1) << 8) | ((uint32)(uint8)(ch2) << 16) | ((uint32)(uint8)(ch3) << 24))
		}

		[Comptime(ConstEval = true)]
		public static uint32 FOURCC(String str)
		{
			Runtime.Assert(str.Length == 4);
			return (uint32)(uint8)(str[0]) | (uint32)(uint8)(str[1]) << 8 | (uint32)(uint8)(str[2]) << 16 | (uint32)(uint8)(str[3]) << 24;
		}
	}
}

namespace Win32.Foundation
{
	extension WIN32_ERROR
	{
		public static implicit operator uint64(Self self) => (uint64)self.Underlying;
	}
}

namespace Win32.Networking.WinSock
{
	public static
	{
		public const uint32 INADDR_ANY       = (.)0x00000000;
		public const uint32 ADDR_ANY         = INADDR_ANY;
		public const uint32 INADDR_BROADCAST = (.)0xffffffff;
	}
}

namespace Win32.UI.Shell.PropertiesSystem
{
	extension PROPERTYKEY
	{
		public this(System.Guid fmtid, uint32 pid)
		{
			this.fmtid = fmtid;
			this.pid = pid;
		}
	}
}

namespace Win32.Devices.Properties
{
	extension DEVPROPKEY
	{
		public this(System.Guid fmtid, uint32 pid)
		{
			this.fmtid = fmtid;
			this.pid = pid;
		}
	}
}