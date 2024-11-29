 SHELL=/bin/bash

ensure_flutter_version: ## Ensures flutter version is 3.16.5
	fvm install 3.24.5
	fvm use 3.24.5
	fvm global 3.24.5

clean: ## Delete the build/ and .dart_tool/ directories
	fvm flutter clean
	
pub_clean: ## Empties the entire system cache to reclaim extra disk space or remove problematic packages
	fvm flutter pub cache clean	

pub_get: ## Gets pubs
	fvm flutter pub get

pub_outdated: ## Check for outdated packages
	fvm flutter pub outdated

pub_repair: ## Performs a clean reinstallation of all packages in your system cache
	fvm flutter pub cache repair

l10n: ## Generates strings
	fvm flutter gen-l10n

build_runner: ## This command generates the files for the code generated dependencies
	fvm dart run build_runner build --delete-conflicting-outputs

build_runner_watch: ## This command generates the files for the code generated dependencies 'automatically during development' 
	fvm dart run build_runner watch --delete-conflicting-outputs

format: 
	fvm dart format $$(find lib test -name '*.dart' -not -name '*.g.dart' -and -not -name '*.freezed.dart') --line-length=120

clean_rebuild: ensure_flutter_version clean pub_clean pub_get l10n build_runner format lint fix_lint 

rebuild: ensure_flutter_version pub_get l10n build_runner format lint fix_lint 

lint: ## Analyzes the codebase for issues
	fvm dart run custom_lint

fix_lint: ## Fixes lint issues
	fvm dart fix --apply

