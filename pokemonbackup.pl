#!/usr/bin/perl

# Set these for your situation
my $POKEMONDIR = "/root/pokemon-online";
my $BACKUPDIR = "/root/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "1.0";

print "Pokemon Backup version $VERSION\n";
print "========================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/pokemonbackup-5.tgz")
{
	unlink("$BACKUPDIR/pokemonbackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/pokemonbackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/pokemonbackup-4.tgz")
{
	rename("$BACKUPDIR/pokemonbackup-4.tgz", "$BACKUPDIR/pokemonbackup-5.tgz");
}
if (-f "$BACKUPDIR/pokemonbackup-3.tgz")
{
	rename("$BACKUPDIR/pokemonbackup-3.tgz", "$BACKUPDIR/pokemonbackup-4.tgz");
}
if (-f "$BACKUPDIR/pokemonbackup-2.tgz")
{
	rename("$BACKUPDIR/pokemonbackup-2.tgz", "$BACKUPDIR/pokemonbackup-3.tgz");
}
if (-f "$BACKUPDIR/pokemonbackup-1.tgz")
{
	rename("$BACKUPDIR/pokemonbackup-1.tgz", "$BACKUPDIR/pokemonbackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/pokemonbackup-1.tgz $POKEMONDIR");
print("Done!\n");
exit 0;
