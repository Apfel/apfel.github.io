# apfel.github.io
This repository contains the [Dart](https://dart.dev/)-written source code for my website, which is powered by [Flutter](https://flutter.dev).

## Paths
All paths must follow this structure:  
`https://apfel.github.io/#/<name>`  
`<name>` now needs to be one of the following paths:

| Path | Tab |
|---|---|
| `/about` | About me |
| `/projects` | Projects |

Unknown paths default to `/about`.

## Build
```sh
flutter pub get # Fetch all packages
flutter build web
```

You'll find a usable page setup in `build/web` now.

## Code style
Because the developers behind flutter seem to have a stick up their ass, you're doomed to live with their stupid code style.  
I'm sorry for any pain caused.
