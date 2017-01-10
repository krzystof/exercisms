package greeting

import "fmt"

const testVersion = 3

func HelloWorld(who string) string {
    name := who
    if name == "" {
        name = "World"
    }
	return fmt.Sprintf("Hello, %s!", name)
}
