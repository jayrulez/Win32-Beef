using System;
namespace Win32.UI.Shell.PropertiesSystem
{
	extension PROPERTYKEY
	{
		public this(Guid fmtid, uint32 pid)
		{
			this.fmtid = fmtid;
			this.pid = pid;
		}
	}
}