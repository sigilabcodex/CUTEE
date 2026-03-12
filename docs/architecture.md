# CUTEE Architecture (Foundation Stage)

## Core principles

- **Modular content packs**: cities and vehicles are isolated in their own folders.
- **Data-driven setup**: city data/rules stored in JSON files.
- **Composable core systems**: core scripts stay generic and city-agnostic.

## Folder contracts

- `core/`: shared systems only, no hardcoded city-specific logic.
- `cities/<city_id>/`: city scene + city config + traffic rules.
- `vehicles/<vehicle_id>/`: vehicle scene + vehicle-specific controller + vehicle tuning JSON.

## Vehicle architecture

- `core/vehicle_controller.gd` is a **lightweight shared base** with:
  - default arcade movement (`update_movement`),
  - reusable input-to-velocity API (`process_input`, `get_velocity`),
  - JSON tuning load (`_get_tuning_config_path`, `apply_tuning`).
- Vehicle scripts in `vehicles/<vehicle_id>/` should stay small and only define:
  - default fallback tuning (`_get_default_tuning`),
  - optional JSON tuning path (`_get_tuning_config_path`),
  - movement overrides only when that vehicle needs a different model.

## Extensibility path

- **Bicycle**: keep using the base arcade movement with bicycle-specific tuning JSON.
- **Motorcycle**: start with the same base, then override `update_movement` in `vehicles/motorcycle/motorcycle_controller.gd` if lean/turn behavior needs to differ.
- **Future vehicles (pecero, taxi, etc.)**: keep each controller and tuning data in its own folder so experiments do not leak into core.

Contributors can add a city by creating a new city folder with the same file contract.
Contributors can add vehicles by extending `core/vehicle_controller.gd` and adding `*_tuning.json` in that vehicle folder.
