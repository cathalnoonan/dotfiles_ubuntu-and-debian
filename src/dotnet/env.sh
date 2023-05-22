#!/usr/bin/env bash

export DOTNET_ROOT=$HOME/.dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_NOLOGO=true
export DOTNET_NUGET_SIGNATURE_VERIFICATION=false

##
# Include dotnet in PATH
##
if [[ "$PATH" != *"$DOTNET_ROOT"* ]]; then
    export PATH="$PATH:$DOTNET_ROOT"
fi

##
# Include dotnet tools folder in PATH
##
if [[ "$PATH" != *"$DOTNET_ROOT/tools"* ]]; then
    export PATH="$PATH:$DOTNET_ROOT/tools"
fi
