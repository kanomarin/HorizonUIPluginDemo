#!/bin/sh
set -e
<<LICENSE

LICENSE
source ~/.bash_profile

export UE4_ENGINE_ROOT=${UE4_ENGINE_ROOT}
export NAME="UE4Editor-HorizonPlugin"
export FEED_NAME="//hsgame/azure-devops/${NAME}"
export FEED_PATH="https://pkgs.dev.azure.com/hsgame/_packaging/${NAME}/nuget/v3/index.json"
export PACKAGE_NAME="UE4Editor-HorizonUIPluginDemo"
BASE_PATH=$(cd "$(dirname "$0")"; pwd)
export NUSPEC_FILE_PATH="${BASE_PATH}/package/nuspec/win64/${PACKAGE_NAME}.nuspec"
echo *************FEED_NAME: ${FEED_NAME}
echo ************FEED_PATH: ${FEED_PATH}
echo ************PACKAGE_NAME: ${PACKAGE_NAME}
echo ************NUSPEC_FILE_PATH: ${NUSPEC_FILE_PATH}
BASE_PATH=$(cd "$(dirname "$0")"; pwd)
PROJECT_ROOT=$(cd "${BASE_PATH}/../"; pwd)
pushd "${PROJECT_ROOT}"

	source ue_ci_scripts/function/sh/ue_deploy_function.sh
	CreateNugetPackage

popd #pushd ${PROJECT_ROOT}
