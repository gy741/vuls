package scan

import (
        "testing"
)

func TestFuzzCrashers(t *testing.T) {

        var crashers = []string{
                ",00,,,",
        }
        o := &debian{}
        for _, f := range crashers {
                o.parseInstalledPackages(string(f))
        }
}
