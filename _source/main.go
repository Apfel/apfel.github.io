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
			body.Set("innerHTML", fmt.Sprintf("Current time is %s:%s:%s, at the %d%s of %s, %d. Your timezone is %s.", toString(t.Hour()), toString(t.Minute()), toString(t.Second()), t.Day(), suffix, t.Month().String(), t.Year(), zone))
		}
	}
}
