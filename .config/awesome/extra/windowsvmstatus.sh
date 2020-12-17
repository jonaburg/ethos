#!/bin/bash

sudo virsh list --all | tail -2 | awk {'print $3'}
