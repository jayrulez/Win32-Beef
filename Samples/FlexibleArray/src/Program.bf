namespace FlexibleArray;

using Win32.NetworkManagement.IpHelper;
using System;
using System.Diagnostics;

class Program
{
	public static void Main()
	{
		IP_INTERFACE_INFO info = .();
		uint32 bufLen = 0;

		GetInterfaceInfo(&info, &bufLen);

		IP_INTERFACE_INFO* infoPtr = (.)scope uint8[IP_INTERFACE_INFO.GetAllocSize(bufLen)]*;

		GetInterfaceInfo(infoPtr, &bufLen);

		for (int i = 0; i < infoPtr.NumAdapters; i++)
		{
			Debug.WriteLine("{}", scope String(&infoPtr.Adapter[i].Name));
		}
	}
}