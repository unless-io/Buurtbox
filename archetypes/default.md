+++
date = '{{ .Date }}'
draft = true
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
+++

<!-- i18n-rule: create matching .en.md and .nl.md files with the same path and basename. -->
