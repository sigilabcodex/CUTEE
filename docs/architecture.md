# CUTEE Architecture (Foundation Stage)

## Core principles

- **Modular content packs**: cities and vehicles are isolated in their own folders.
- **Data-driven setup**: city data/rules stored in JSON files.
- **Composable core systems**: core scripts stay generic and city-agnostic.

## Folder contracts

- `core/`: shared systems only, no hardcoded city-specific logic.
- `cities/<city_id>/`: city scene + city config + traffic rules.
- `vehicles/<vehicle_id>/`: vehicle scene + vehicle-specific controller.

## Extensibility

Contributors can add a city by creating a new city folder with the same file contract.
Contributors can add vehicles by extending `core/vehicle_controller.gd`.
