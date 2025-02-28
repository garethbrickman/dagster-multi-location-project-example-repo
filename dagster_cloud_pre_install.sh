#!/bin/bash
echo "=== Running dagster_cloud_pre_install.sh ==="

echo "Attempting to copy ../shared-dir into the current directory as ./shared-dir..."
cp -R ../shared-dir ./shared-dir
if [ $? -eq 0 ]; then
  echo "Successfully copied shared-dir."
else
  echo "ERROR: Failed to copy shared-dir. Ensure ../shared-dir exists in the build context."
  exit 1
fi

echo "Modifying requirements.txt to update '../shared-dir' reference to './shared-dir'..."
sed -i 's|\.\./shared-dir|./shared-dir|g' requirements.txt
if [ $? -eq 0 ]; then
  echo "Successfully updated requirements.txt. New contents:"
  cat requirements.txt
else
  echo "ERROR: Failed to update requirements.txt."
  exit 1
fi

echo "=== Finished dagster_cloud_pre_install.sh ==="
