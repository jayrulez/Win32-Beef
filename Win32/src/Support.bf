namespace Win32
{
	public static
	{
		public const uint ANYSIZE_ARRAY = 1;
		public const uint32 FALSE = 0;
		public const uint32 TRUE = 1;
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
