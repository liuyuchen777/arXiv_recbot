#!/bin/bash

# Function to train the model
train_model() {
    echo "Training preference model..."
    python preference_model.py
}

# Function to run the main script
run_main_script() {
    echo "Starting arxiv checker..."
    ./run.sh
}

# Main loop
while true; do
    # Run the main script in the background
    run_main_script &
    MAIN_PID=$!

    # Wait for 24 hours (86400 seconds)
    sleep 86400

    # Kill the main script
    echo "Stopping arxiv checker for model update..."
    kill $MAIN_PID

    # Train the model
    train_model

    echo "Restarting process..."
done 
