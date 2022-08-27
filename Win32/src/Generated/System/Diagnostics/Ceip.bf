using Win32.Foundation;
using System;

namespace Win32.System.Diagnostics.Ceip;

#region TypeDefs
#endregion

#region Enums
#endregion

#region Function Pointers
#endregion

#region Structs
#endregion

#region COM Class IDs
public static
{
}
#endregion

#region COM Types
#endregion

#region Functions
public static
{
	[Import("KERNEL32.lib"), CLink, CallingConvention(.Stdcall)]
	public static extern BOOL CeipIsOptedIn();

}
#endregion

