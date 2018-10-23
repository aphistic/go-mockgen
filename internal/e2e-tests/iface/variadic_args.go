package iface

type Client interface {
	Close() error
	Do(command string) (interface{}, error)
	DoArgs(command string, args ...interface{}) (interface{}, error)
}
