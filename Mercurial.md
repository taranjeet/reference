MQ is rarely needed for new Mercurial users. If you're used to it and you like it, by all means, keep using it. But if you are learning Mercurial, instead use modern tools, such as hg rebase, hg histedit, hg graft, hg strip, hg strip --keep, and hg commit --amend. Check the documentation for each of these commands.

The problems with MQ is that (1) it introduces a new concept, the patch, which is essentially a commit that doesn't know merge logic and (2) many of its operations (qrefresh, qfold, qdelete) do not produce any backups, so it's easy to lose work.

If you're already an advanced MQ user, for example, you have your patch series under hg control (yo dawg...), and you are feeling adventurous you can try using Evolve right now. It's still a work-in-progress, so beware, but it's already quite usable, and it needs more testers.

2. Introduction

In a distributed development model, changesets are traditionally immutable. Once a commit is done, it lives in the project history forever. This can make it difficult to develop a set of individual changes for submission upstream to a project maintainer. As the code matures over time, the development repository gathers a number of merges and changesets. This history is important for the individual developer, but can be very difficult to review when sent upstream.

Andrew Morton originally developed a set of scripts for maintaining kernel patches outside of any SCM tool. Others extended these into a suite called quilt. The basic idea behind quilt is to maintain patches instead of maintaining source files. Patches can be added, removed or reordered, and they can be refreshed as you fix bugs or update to a new base revision. quilt is very powerful, but it is not integrated with the underlying SCM tools. This makes it difficult to visualize your changes.

The patch queue extension integrates quilt functionality into Mercurial. Changes are maintained as patches which are committed into Mercurial. Commits can be removed or reordered, and the underlying patch can be refreshed based on changes made in the working directory. The patch directory can also be placed under revision control, so you can have a separate history of changes made to your patches.

3. Configuration

Enable the extension by adding following lines to your configuration file (.hgrc or Mercurial.ini):


[extensions]
mq =


4. Using Mercurial Queues

After the extension is properly installed, hg help will include the mq commands. These all start with q, and try to mimic commands under quilt. The patch queue lives in a directory named .hg/patches. .hg/patches/series lists the patches in the order they will be applied. You can change the patch order simply by moving them around in the series file. Make sure to only change entries in the series file for patches that are not currently applied.

5. Merging patches with new upstream revisions

The Rebase Extension can help a lot with merging a patch or series of patches to a newer head from upstream. In many cases, it can be as simple as:


$ hg pull
$ hg rebase -s <rev1> -d <rev2>


This will rebase rev1 (probably the oldest applied revision tracked by mq) and all of its descendants onto rev2 (probably the newest revision that you just pulled), merging as needed. It is necessary that the revisions be applied; patches that have been popped are ignored. Once complete, the rebased series of revisions will be tracked by mq as it was before, so it is still possible to go back and edit earlier mq-tracked revisions.

6. Tutorial

Find out more about mq in MqTutorial.

7. Hook Examples

You will often not want to push or pull changes from a repository which has patches applied to it. To prevent yourself from doing this accidentally, you can add these hooks to your repository .hg/hgrc.

Mercurial 0.9.2 and above won't allow pushing without --force anyway -- ThomasArendsenHein 2007-01-05 08:36:33


[hooks]

# Prevent "hg pull" if MQ patches are applied.
prechangegroup.mq-no-pull = ! hg qtop > /dev/null 2>&1
# Prevent "hg push" if MQ patches are applied.
preoutgoing.mq-no-push = ! hg qtop > /dev/null 2>&1
In Mercurial 2.1 and above, you may wish to use mq secret phase integration.

8. Command Examples


cd some_existing_hg_repository

# setup the patch queue directory (Deprecated in 1.5)
hg qinit

# create a new patch named firstpatch
hg qnew firstpatch

# edit some files
vi filename

# update the patch to contain your changes
hg qrefresh

# vi .hg/patches/firstpatch to see the result
# print the current patch to the screen
hg qdiff

# make some more changes
vi filename

# see the differences not yet stored in the patch
hg diff

# update the patch
hg qrefresh

# create another patch
hg qnew secondpatch

# Make more changes, and update the new patch
vi filename
hg qrefresh

# Look at the patches you have applied
# Look at all the patches in the queue
hg qapplied
hg qseries

# remove the top patch
hg qpop

# apply the patch again
hg qpush

# remove all patches
hg qpop -a

# apply all patches
hg qpush -a
9. Tips

9.1. Email all applied patches


hg email qbase:qtip
9.2. Convert all applied patches into permanent changesets


hg qfinish -a
9.3. Output all applied patches as a single patch


hg diff -r qparent:qtip
9.4. Put away temporary work and resume later

This is a Mercurual equivalent of git stash command.

hg qnew choosename
hg qpop
# ...
# restore
hg qpush
hg strip -k choosename
hg qremove choosename
9.5. Force all patches to always be in git format

Add this to your .hgrc

[diff]
git=1
9.6. Prevent qrefresh from updating timestamps

If you're keeping your patch queue under revision control, it can be quite annoying when every qrefresh updates the timestamps in your patch. To prevent this you can add this to your .hgrc

[diff]
nodates=1
9.7. How to add a qstatus command

Add this to your .hgrc (see AliasExtension):

[alias]
qstatus = status --rev -2:.
Other useful aliases might be "status --rev qparent:." or "status --rev qparent:qtip"

9.8. How to update the commit message on a patch

If you want to change a one-line message, simply run:

hg qrefresh -m "New Message"
To edit a multiline message, run:

hg qrefresh -e
This will use $EDITOR to edit the commit message.

9.9. Publishing patches

If you're tweaking a patch queue over time, it can get tedious to continually update a published repository with the latest changes. Hooks can make the process pretty automatic. You should have two repositories, one being the base repository and one being a repository of your patches, such as hg qinit -c would create.

In the patch repository, which should be in the root of your main repository, in .hg/patches, set up some changegroup hooks:

[hooks]
# check out the latest version of the patches
changegroup.1update = hg update
# pop the old version from the base repo
changegroup.2pop = hg -R ../.. qpop -a
# push the versions that were just checked out
changegroup.3push = hg -R ../.. qpush -a
If you're feeling really fancy, you could also publish the patch repository itself with another hook:

changegroup.publish = hg push ../../../patches/foo
The overlay patch queue is published this way at http://hg.kublai.com/mercurial/overlay

9.10. Ensure patch queue changesets use secret Phase

For backwards compatibility, mq may not use the secret phase by default to prevent queue patches from being exchanged with other repositories. For many this is desirable behavior though, so mq has secret phase integration that you may explicitly opt into:

[mq]
secret = True