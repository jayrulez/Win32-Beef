using Win32.System.Com;
using Win32.Foundation;
using Win32.Media.MediaFoundation;
using System;

namespace Win32.Media.Streaming;

#region Enums

[AllowDuplicates]
public enum MF_TRANSFER_VIDEO_FRAME_FLAGS : int32
{
	MF_TRANSFER_VIDEO_FRAME_DEFAULT = 0,
	MF_TRANSFER_VIDEO_FRAME_STRETCH = 1,
	MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR = 2,
}


[AllowDuplicates]
public enum MF_MEDIASOURCE_STATUS_INFO : int32
{
	MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED = 0,
	MF_MEDIASOURCE_STATUS_INFO_UNKNOWN = 1,
}

#endregion


#region Structs
[CRepr]
public struct FaceRectInfoBlobHeader
{
	public uint32 Size;
	public uint32 Count;
}

[CRepr]
public struct FaceRectInfo
{
	public RECT Region;
	public int32 confidenceLevel;
}

[CRepr]
public struct FaceCharacterizationBlobHeader
{
	public uint32 Size;
	public uint32 Count;
}

[CRepr]
public struct FaceCharacterization
{
	public uint32 BlinkScoreLeft;
	public uint32 BlinkScoreRight;
	public uint32 FacialExpression;
	public uint32 FacialExpressionScore;
}

[CRepr]
public struct CapturedMetadataExposureCompensation
{
	public uint64 Flags;
	public int32 Value;
}

[CRepr]
public struct CapturedMetadataISOGains
{
	public float AnalogGain;
	public float DigitalGain;
}

[CRepr]
public struct CapturedMetadataWhiteBalanceGains
{
	public float R;
	public float G;
	public float B;
}

[CRepr]
public struct MetadataTimeStamps
{
	public uint32 Flags;
	public int64 Device;
	public int64 Presentation;
}

[CRepr]
public struct HistogramGrid
{
	public uint32 Width;
	public uint32 Height;
	public RECT Region;
}

[CRepr]
public struct HistogramBlobHeader
{
	public uint32 Size;
	public uint32 Histograms;
}

[CRepr]
public struct HistogramHeader
{
	public uint32 Size;
	public uint32 Bins;
	public uint32 FourCC;
	public uint32 ChannelMasks;
	public HistogramGrid Grid;
}

[CRepr]
public struct HistogramDataHeader
{
	public uint32 Size;
	public uint32 ChannelMask;
	public uint32 Linear;
}

#endregion

#region COM Types
[CRepr]struct IMFDeviceTransform : IUnknown
{
	public new const Guid IID = .(0xd818fbd8, 0xfc46, 0x42f2, 0x87, 0xac, 0x1e, 0xa2, 0xd1, 0xf9, 0xbf, 0x32);

	public new VTable* VT { get => (.)mVT; }

	[CRepr]public struct VTable : IUnknown.VTable
	{
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, IMFAttributes* pAttributes) InitializeTransform;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwInputStreamID, uint32 dwTypeIndex, IMFMediaType** pMediaType) GetInputAvailableType;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwInputStreamID, IMFMediaType** pMediaType) GetInputCurrentType;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwInputStreamID, IMFAttributes** ppAttributes) GetInputStreamAttributes;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwOutputStreamID, uint32 dwTypeIndex, IMFMediaType** pMediaType) GetOutputAvailableType;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwOutputStreamID, IMFMediaType** pMediaType) GetOutputCurrentType;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwOutputStreamID, IMFAttributes** ppAttributes) GetOutputStreamAttributes;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32* pcInputStreams, uint32* pcOutputStreams) GetStreamCount;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwInputIDArraySize, uint32* pdwInputStreamIds, uint32 dwOutputIDArraySize, uint32* pdwOutputStreamIds) GetStreamIDs;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwInputStreamID, IMFMediaEvent* pEvent) ProcessEvent;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwInputStreamID, IMFSample* pSample, uint32 dwFlags) ProcessInput;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, MFT_MESSAGE_TYPE eMessage, uint ulParam) ProcessMessage;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwFlags, uint32 cOutputBufferCount, MFT_OUTPUT_DATA_BUFFER* pOutputSample, uint32* pdwStatus) ProcessOutput;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamID, IMFMediaType* pMediaType, DeviceStreamState value, uint32 dwFlags) SetInputStreamState;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamID, DeviceStreamState* value) GetInputStreamState;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamID, IMFMediaType* pMediaType, DeviceStreamState value, uint32 dwFlags) SetOutputStreamState;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamID, DeviceStreamState* value) GetOutputStreamState;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamID, DeviceStreamState* value, IMFMediaType** ppMediaType) GetInputStreamPreferredState;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamIndex, uint32 dwFlags) FlushInputStream;
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, uint32 dwStreamIndex, uint32 dwFlags) FlushOutputStream;
	}


	public HRESULT InitializeTransform(IMFAttributes* pAttributes) mut => VT.[Friend]InitializeTransform(&this, pAttributes);

	public HRESULT GetInputAvailableType(uint32 dwInputStreamID, uint32 dwTypeIndex, IMFMediaType** pMediaType) mut => VT.[Friend]GetInputAvailableType(&this, dwInputStreamID, dwTypeIndex, pMediaType);

	public HRESULT GetInputCurrentType(uint32 dwInputStreamID, IMFMediaType** pMediaType) mut => VT.[Friend]GetInputCurrentType(&this, dwInputStreamID, pMediaType);

	public HRESULT GetInputStreamAttributes(uint32 dwInputStreamID, IMFAttributes** ppAttributes) mut => VT.[Friend]GetInputStreamAttributes(&this, dwInputStreamID, ppAttributes);

	public HRESULT GetOutputAvailableType(uint32 dwOutputStreamID, uint32 dwTypeIndex, IMFMediaType** pMediaType) mut => VT.[Friend]GetOutputAvailableType(&this, dwOutputStreamID, dwTypeIndex, pMediaType);

	public HRESULT GetOutputCurrentType(uint32 dwOutputStreamID, IMFMediaType** pMediaType) mut => VT.[Friend]GetOutputCurrentType(&this, dwOutputStreamID, pMediaType);

	public HRESULT GetOutputStreamAttributes(uint32 dwOutputStreamID, IMFAttributes** ppAttributes) mut => VT.[Friend]GetOutputStreamAttributes(&this, dwOutputStreamID, ppAttributes);

	public HRESULT GetStreamCount(uint32* pcInputStreams, uint32* pcOutputStreams) mut => VT.[Friend]GetStreamCount(&this, pcInputStreams, pcOutputStreams);

	public HRESULT GetStreamIDs(uint32 dwInputIDArraySize, uint32* pdwInputStreamIds, uint32 dwOutputIDArraySize, uint32* pdwOutputStreamIds) mut => VT.[Friend]GetStreamIDs(&this, dwInputIDArraySize, pdwInputStreamIds, dwOutputIDArraySize, pdwOutputStreamIds);

	public HRESULT ProcessEvent(uint32 dwInputStreamID, IMFMediaEvent* pEvent) mut => VT.[Friend]ProcessEvent(&this, dwInputStreamID, pEvent);

	public HRESULT ProcessInput(uint32 dwInputStreamID, IMFSample* pSample, uint32 dwFlags) mut => VT.[Friend]ProcessInput(&this, dwInputStreamID, pSample, dwFlags);

	public HRESULT ProcessMessage(MFT_MESSAGE_TYPE eMessage, uint ulParam) mut => VT.[Friend]ProcessMessage(&this, eMessage, ulParam);

	public HRESULT ProcessOutput(uint32 dwFlags, uint32 cOutputBufferCount, MFT_OUTPUT_DATA_BUFFER* pOutputSample, uint32* pdwStatus) mut => VT.[Friend]ProcessOutput(&this, dwFlags, cOutputBufferCount, pOutputSample, pdwStatus);

	public HRESULT SetInputStreamState(uint32 dwStreamID, IMFMediaType* pMediaType, DeviceStreamState value, uint32 dwFlags) mut => VT.[Friend]SetInputStreamState(&this, dwStreamID, pMediaType, value, dwFlags);

	public HRESULT GetInputStreamState(uint32 dwStreamID, DeviceStreamState* value) mut => VT.[Friend]GetInputStreamState(&this, dwStreamID, value);

	public HRESULT SetOutputStreamState(uint32 dwStreamID, IMFMediaType* pMediaType, DeviceStreamState value, uint32 dwFlags) mut => VT.[Friend]SetOutputStreamState(&this, dwStreamID, pMediaType, value, dwFlags);

	public HRESULT GetOutputStreamState(uint32 dwStreamID, DeviceStreamState* value) mut => VT.[Friend]GetOutputStreamState(&this, dwStreamID, value);

	public HRESULT GetInputStreamPreferredState(uint32 dwStreamID, DeviceStreamState* value, IMFMediaType** ppMediaType) mut => VT.[Friend]GetInputStreamPreferredState(&this, dwStreamID, value, ppMediaType);

	public HRESULT FlushInputStream(uint32 dwStreamIndex, uint32 dwFlags) mut => VT.[Friend]FlushInputStream(&this, dwStreamIndex, dwFlags);

	public HRESULT FlushOutputStream(uint32 dwStreamIndex, uint32 dwFlags) mut => VT.[Friend]FlushOutputStream(&this, dwStreamIndex, dwFlags);
}

[CRepr]struct IMFDeviceTransformCallback : IUnknown
{
	public new const Guid IID = .(0x6d5cb646, 0x29ec, 0x41fb, 0x81, 0x79, 0x8c, 0x4c, 0x6d, 0x75, 0x08, 0x11);

	public new VTable* VT { get => (.)mVT; }

	[CRepr]public struct VTable : IUnknown.VTable
	{
		protected new function [CallingConvention(.Stdcall)] HRESULT(SelfOuter* self, IMFAttributes* pCallbackAttributes, uint32 pinId) OnBufferSent;
	}


	public HRESULT OnBufferSent(IMFAttributes* pCallbackAttributes, uint32 pinId) mut => VT.[Friend]OnBufferSent(&this, pCallbackAttributes, pinId);
}

#endregion
