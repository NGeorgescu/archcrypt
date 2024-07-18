rm -f all.tar.gz && tar czf all.tar.gz $(find . -maxdepth 1 -type f -name "*.sh" ! -name "_*.sh")
