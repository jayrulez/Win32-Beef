using Win32.System.Com;
using Win32.Foundation;
using Win32.Graphics.Gdi;
using System;

namespace Win32.System.WinRT.Graphics.Capture;

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
[CRepr]struct IGraphicsCaptureItemInterop : IUnknown
{
	public new const Guid IID = .(0x3628e81b, 0x3cac, 0x4c60, 0xb7, 0xf4, 0x23, 0xce, 0x0e, 0x0c, 0x33, 0x56);

	public new VTable* VT { get => (.)mVT; }

	[CRepr]public struct VTable : IUnknown.VTable
	{
		protected new function [CallingConvention(.Stdcall)] HRESULT(/*IGraphicsCaptureItemInterop*/SelfOuter* self, HWND window, Guid riid, void** result) CreateForWindow;
		protected new function [CallingConvention(.Stdcall)] HRESULT(/*IGraphicsCaptureItemInterop*/SelfOuter* self, HMONITOR monitor, Guid riid, void** result) CreateForMonitor;
	}


	public HRESULT CreateForWindow(HWND window, Guid riid, void** result) mut => VT.[Friend]CreateForWindow(&this, window, riid, result);

	public HRESULT CreateForMonitor(HMONITOR monitor, Guid riid, void** result) mut => VT.[Friend]CreateForMonitor(&this, monitor, riid, result);
}

#endregion

