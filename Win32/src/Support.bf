namespace Win32
{
	public static
	{
		public const uint ANYSIZE_ARRAY = 1;
		public const uint32 FALSE = 0;
		public const uint32 TRUE = 1;

		public static bool SUCCEEDED(Win32.Foundation.HRESULT hr)
		{
			return hr >= 0;
		}

		public static bool FAILED(Win32.Foundation.HRESULT hr)
		{
			return hr < 0;
		}
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
