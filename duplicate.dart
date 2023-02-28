import 'dart:io';

import 'fetch.dart';


main() async {
  for (var i = 0; i < states.length; i++) {
    final stateName =
        states[i].replaceAll('-', '_').replaceAll(' ', '_').toLowerCase();

    final file =
        await File('.github/workflows/$stateName.yml').create(recursive: true);
        
    await file.writeAsString(createYaml(i));
  }
}

String createYaml(int stateIndex) =>
    '''# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.

name: ${states[stateIndex]} Result Fetch

on: workflow_dispatch

jobs:
  build:
    continue-on-error: true
    runs-on: ubuntu-latest
    permissions: write-all
    steps:
      - uses: actions/checkout@v3
      
      - name: setup git config
        run: |
          # setup the username and email. I tend to use 'GitHub Actions Bot' with no email by default
          git config user.name "GitHub Actions Bot"
          git config user.email "<>"
          git config pull.ff true
          git config http.version HTTP/1.1
          git config http.postBuffer 157286400

      # Note: This workflow uses the latest stable version of the Dart SDK.
      # You can specify other versions if desired, see documentation here:
      # https://github.com/dart-lang/setup-dart/blob/main/README.md
      # - uses: dart-lang/setup-dart@v1
      - uses: dart-lang/setup-dart@9a04e6d73cca37bd455e0608d7e5092f881fd603

      - name: Install dependencies
        run: dart pub get

      # Uncomment this step to verify the use of 'dart format' on each commit.
      # - name: Verify formatting
      #   run: dart format --output=none --set-exit-if-changed .

      # Consider passing '--fatal-infos' for slightly stricter analysis.
      - name: Analyze project source
        run: dart analyze

      # Your project will need to have tests in test/ and a dependency on
      # package:test for this step to succeed. Note that Flutter projects will
      # want to change this to 'flutter test'.
      - name: Fetch polling units
        run: dart fetch.dart $stateIndex
      
      - name: Upload polling uings data
        if: \${{ always() }}
        run: |
            # upload pus file
            git add .
            git commit -m "update only pus files"
            git pull
            git push origin main

      - name: Download Results
        run: dart download.dart $stateIndex
        
      - name: Upload Results
        run: |
          # Stage the file, commit and push
          git add .
          git commit -m "new result fetch"
          git pull
          git push origin main

''';
