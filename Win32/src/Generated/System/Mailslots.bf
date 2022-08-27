using Win32.Foundation;
using Win32.Security;
using System;

namespace Win32.System.Mailslots;

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
	public static extern HANDLE CreateMailslotA(PSTR lpName, uint32 nMaxMessageSize, uint32 lReadTimeout, SECURITY_ATTRIBUTES* lpSecurityAttributes);

	[Import("KERNEL32.lib"), CLink, CallingConvention(.Stdcall)]
	public static extern HANDLE CreateMailslotW(PWSTR lpName, uint32 nMaxMessageSize, uint32 lReadTimeout, SECURITY_ATTRIBUTES* lpSecurityAttributes);

	[Import("KERNEL32.lib"), CLink, CallingConvention(.Stdcall)]
	public static extern BOOL GetMailslotInfo(HANDLE hMailslot, uint32* lpMaxMessageSize, uint32* lpNextSize, uint32* lpMessageCount, uint32* lpReadTimeout);

	[Import("KERNEL32.lib"), CLink, CallingConvention(.Stdcall)]
	public static extern BOOL SetMailslotInfo(HANDLE hMailslot, uint32 lReadTimeout);

}
#endregion
