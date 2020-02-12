package main

import (
	"fmt"
	"syscall/js"
	"time"
)

func main() {
	toString := func(value int) string {
		val := fmt.Sprintf("%d", value)
		if len(val) == 1 {
			val = "0" + val
		}
	
		return val
	}

	body := js.Global().Get("document").Call("getElementById", "time-message")
	ticker := time.NewTicker(time.Second)
	defer ticker.Stop()

	for {
		select {
		case t := <-ticker.C:
			var suffix string
			switch t.Day() {
			case 1:
				suffix = "st"
				break
			case 2:
				suffix = "nd"
				break
			case 3:
				suffix = "rd"
				break
			default:
				suffix = "th"
			}

			body.Set("innerHTML", fmt.Sprintf("Current time is %s:%s:%s, at the %d%s of %s, %d.\n", toString(t.Hour()), toString(t.Minute()), toString(t.Second()), t.Day(), suffix, t.Month().String(), t.Year()))
		}
	}
}
