# Dead Mer Tell No Tales (OpenMW)

## 1.2

### Features

- Added quest edgecases handling. For manual patching rare quests when NPC hands over their property to you, but does not actually despawn. Not retroactive
- Added "Unwanted Advances" quest from Project Cyrodiil to quest edgecases

## 1.1.3

### Changes

- Guards and ordinators don't disown their items anymore

## 1.1.2

### Fixes

- Fixed internal naming to reduce warnings in the log

## 1.1.1

### Changes

- Minor text tweaks

## 1.1

### !! Dead actor list will reset on this mod update !! (hopefully for the last time)

### Features

- Added disabled actors support
- Added mod options
  - Toggle for recording killed actors
  - Toggle for recording disabled actors (via quest or `disable` command)
  - Toggles for disowning object types:
    - Items
    - Containers
    - Activators (beds, levers etc)
    - Doors
  - Toggle for debug information
- Added empty actor blacklist for futureproofing

### Fixes

- Dead actor lists are now actually save-specific and not global (for real this time)

## 1.0.1

### !! Dead actor list will reset on this mod update !!

### Fixes

- Dead actor lists are now actually save-specific and not global

## 1.0

Initial release