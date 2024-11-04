.PHONY: install uninstall \
	gm gitmerge

install:
	@bat ./install.bat

uninstall:
	@bat ./uninstall.bat

gm gitmerge:
	@git switch master && git merge --no-ff -m "merge dev" dev && git push && git switch dev
