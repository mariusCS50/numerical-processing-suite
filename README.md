# Numerical Processing Suite

A collection of tools for processing numerical data in music, robotics, and recommendation systems. This project implements audio signal processing (e.g., reverb, low-pass filtering), data interpolation, and recommendation algorithms using MATLAB/Octave and Python.

## Features

- **Audio Processing:**
  - Create and manipulate sounds (e.g., reverb, low-pass filtering)
  - Convert stereo audio to mono

- **Data Interpolation (Robotzii):**
  - Parsing input data and performing interpolation tasks

- **Recommendation Systems:**
  - Implement algorithms for generating recommendations based on input data

## Building the Project

The project provides a shell script and Dockerfile to streamline the testing process:

```bash
./local.sh   # Build the Docker image (if needed) and run the tests
```

Alternatively, run the Python-based checker directly:

```bash
./checker.py
```

## Command-Line Usage

While the project does not offer an interactive mode, it includes scripts that execute various operations for each module. For example, you can:

- **Audio Processing:** Run corresponding MATLAB scripts that process and save audio files.
- **Data Interpolation & Recommendations:** Execute the relevant scripts to parse input data, apply processing functions, and generate outputs.

## Implementation Details

The project is organized into several modules:

- `checker/`
  Contains the test runner (`checker.py`), JSON configuration (`config.json`), and MATLAB scripts for performing task-specific validations.

- `src/numerical_music/`
  Implements functions for sound creation and manipulation with scripts like:
  - `create_sound.m`
  - `apply_reverb.m`
  - `low_pass.m`

- `src/robotzii/`
  Contains parsing and interpolation scripts.

- `src/recommendations/`
  Provides algorithms for generating recommendations.

- `Dockerfile`
  Defines the containerized environment for executing the tests.

## Example Usage

To run the full suite of tests:

```bash
./local.sh
```

To execute the checker directly:

```bash
./checker.py
```

## Technical Notes

- Tests are conducted using MATLAB/Octave scripts that load input data, process it, and compare results to expected outputs.
- The JSON configuration file (`config.json`) defines test groups, expected file paths, and tolerance for approximate comparisons.
- The project leverages both Python and MATLAB/Octave scripts to ensure a robust validation of each component.
- Docker is used to provide a consistent testing environment across different systems.
