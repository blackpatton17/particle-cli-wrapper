package gode

import (
	"os"
	"path/filepath"
)

// Target represents a node tarball
type Target struct {
	Arch string
	OS   string
	URL  string
	Base string
	Sha  string
}

func (t *Target) basePath() string {
	return filepath.Join(rootPath, t.Base)
}

func (t *Target) nodePath() string {
	return nodePathFromBase(t.basePath())
}

func (t *Target) npmPath() string {
	return npmPathFromBase(t.basePath())
}

func (t *Target) isSetup() (bool, error) {
	return isSetup(t.nodePath(), t.npmPath())
}

func (t *Target) setup() error {
	if t.OS == "windows" {
		if err := t.setupWindows(); err != nil {
			return err
		}
	} else {
		if err := t.setupUnix(); err != nil {
			return err
		}
	}
	return downloadNpm(t.npmPath())
}

func (t *Target) clearOldNodeInstalls() error {
	for _, name := range getNodeInstalls() {
		if name != t.Base {
			return os.RemoveAll(filepath.Join(rootPath, name))
		}
	}
	return nil
}
