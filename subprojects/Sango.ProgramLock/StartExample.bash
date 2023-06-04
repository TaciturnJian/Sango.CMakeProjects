#!bin/bash

ProgramName="TEST"
ProgramDirectory="./out/bin"
PROGRAM_LOCK_NAME=${ProgramName}_Lock
# Program Lock File Name must be: ProgramName_Lock

### Kill Lock: 
# killall ${PROGRAM_LOCK_NAME}

echo "0. Check Program Lock"
LIST_PROGRAMS="ps -le" 
GREP_LOCK="grep $PROGRAM_LOCK_NAME"
FIND_RUNNING_LOCK=$($LIST_PROGRAMS | $GREP_LOCK)
if [ ${#FIND_RUNNING_LOCK} -gt 0 ]; then
    echo "Found running Program Lock:(${PROGRAM_LOCK_NAME}), exit now"
    exit 0
fi

echo "1. Find Executable(${ProgramName})"
FIND_EXECUTABLE="find ${ProgramDirectory}/${ProgramName}"
if ! [ $(${FIND_EXECUTABLE}) ]; then
    echo "Cannot find target Program(${ProgramName}) in Directory(${ProgramDirectory})"
    exit -1
fi

echo "2. Find Program Lock"
FIND_PROGRAM_LOCK="find ${ProgramDirectory}/${PROGRAM_LOCK_NAME}"
if ! [ $(${FIND_PROGRAM_LOCK}) ]; then
    echo "Cannot find target ProgramLock(${PROGRAM_LOCK_NAME}) in Directory(${ProgramDirectory})"
    exit -1
fi

echo "3. Running Lock And Program"
${ProgramDirectory}/${PROGRAM_LOCK_NAME} 60000 & 
${ProgramDirectory}/${ProgramName} &
