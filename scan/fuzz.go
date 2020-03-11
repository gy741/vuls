package scan

func Fuzz(data []byte) int {
  o := &debian{}
  if _,_, err := o.parseInstalledPackages(string(data)); err != nil {
    return 0
  }
  return 1
}
