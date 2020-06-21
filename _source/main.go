package main

import (
	"fmt"
	"syscall/js"
	"time"
)

func main() {
	var (
		body	= js.Global().Get("document").Call("getElementById", "time-message")
		ticker	= time.NewTicker(time.Second)
	)
	
	defer ticker.Stop()

	for {
		select {
		case t := <-ticker.C:
			suffix := "th"

			switch t.Day() {
			case 1:
			case 21:
			case 31:
				suffix = "st"
				break

			case 2:
			case 22:
				suffix = "nd"
				break

			case 3:
			case 23:
				suffix = "rd"
				break
			}

			zone, _ := t.Zone()
			body.Set("innerHTML", fmt.Sprintf("Current time is %02d:%02d:%02d, at the %d%s of %s, %d. Your timezone is \"%s\".", t.Hour(), t.Minute(), t.Second(), t.Day(), suffix, t.Month().String(), t.Year(), zone))
		}
	}
}
