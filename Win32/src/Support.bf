namespace Win32
{
	public static
	{
		public const uint ANYSIZE_ARRAY = 1;
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
