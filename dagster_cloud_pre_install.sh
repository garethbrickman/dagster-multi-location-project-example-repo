#!/bin/bash
# Ensure that the shared directory is available where pip expects it.
# This command assumes that your build context includes the repo root.
cp -R shared-dir $(dirname location2-dir/requirements.txt)/shared-dir
