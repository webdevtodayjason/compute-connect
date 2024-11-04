#!/bin/bash

# Check if the config file exists
CONFIG_FILE="projects.config"
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Config file '$CONFIG_FILE' not found. Please create it with a list of project IDs."
  exit 1
fi

# Read projects from the config file
PROJECTS=($(cat $CONFIG_FILE))

# Display available projects
echo "Available Projects:"
for i in "${!PROJECTS[@]}"; do
  echo "$((i+1)). ${PROJECTS[$i]}"
done

# Prompt for project selection
echo -n "Select the project number: "
read PROJECT_SELECTION

if [[ $PROJECT_SELECTION -lt 1 || $PROJECT_SELECTION -gt ${#PROJECTS[@]} ]]; then
  echo "Invalid selection. Exiting."
  exit 1
fi

PROJECT_ID=${PROJECTS[$((PROJECT_SELECTION-1))]}

# Set the selected project
echo "Setting project to $PROJECT_ID..."
gcloud config set project $PROJECT_ID

# List active instances with numbering
echo "Fetching list of active instances..."
gcloud compute instances list --filter="status=RUNNING" --format="table[no-heading](name, zone, external_ip)" | nl

# Check if any instances are listed
INSTANCE_COUNT=$(gcloud compute instances list --filter="status=RUNNING" --format="value(name)" | wc -l)
if [ "$INSTANCE_COUNT" -eq 0 ]; then
  echo "No active instances found. Exiting."
  exit 1
fi

# Prompt for instance selection
echo -n "Select the instance number to connect to: "
read INSTANCE_NUMBER

# Get the selected instance details
INSTANCE_NAME=$(gcloud compute instances list --filter="status=RUNNING" --format="table[no-heading](name)" | sed -n "${INSTANCE_NUMBER}p")
INSTANCE_ZONE=$(gcloud compute instances list --filter="status=RUNNING" --format="table[no-heading](zone)" | sed -n "${INSTANCE_NUMBER}p")

# Check if the instance name is valid
if [ -z "$INSTANCE_NAME" ]; then
  echo "Invalid instance selection. Exiting."
  exit 1
fi

# Connect to the instance
echo "Connecting to $INSTANCE_NAME in zone $INSTANCE_ZONE..."
gcloud compute ssh $INSTANCE_NAME --zone $INSTANCE_ZONE

