# CUTEE – Chaotic Urban Transit & Errand Engine

CUTEE is an open-source arcade-style urban transport chaos simulator inspired by **Crazy Taxi**, early **GTA**, and the energy of chaotic public transport systems worldwide.

This repository contains the **initial Godot 4 project foundation** focused on modular architecture, not gameplay implementation.

## Goals of this stage

- Establish a clean, extensible project layout.
- Support future additions of multiple cities and vehicle types.
- Keep systems data-driven to enable modding and AI-generated modules.
- Make collaboration straightforward for open-source contributors.

## Project layout

- `godot/`: Godot project files and main scene bootstrap.
- `core/`: Shared gameplay systems (traffic, missions, passengers, city loading).
- `cities/`: Self-contained city modules (starting with `cdmx`).
- `vehicles/`: Vehicle modules with per-vehicle scenes/controllers.
- `assets/`: Shared models, textures, and audio placeholders.
- `docs/`: Architecture notes and gameplay concept docs.

## Running the project

1. Open `godot/project.godot` in Godot 4.x.
2. Run the project.
3. The project starts in a minimal sandbox scene (`godot/main.tscn`).

## Contribution notes

- New city modules should live under `cities/<city_id>/` with config and scene files.
- New vehicles should live under `vehicles/<vehicle_id>/` with a dedicated controller script.
- Avoid hardcoding city behavior in core systems; use JSON-driven configuration.
