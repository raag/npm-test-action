#!/bin/sh -l
time=$(date)
echo "$time Run: npm install"
npm install

time=$(date)
echo "$time Run: npm run test"
npm run test