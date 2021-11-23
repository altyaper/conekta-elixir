clean:
	mix deps.clean --unlock --unused

deep-clean:
	rm -rf _build
	rm -rf deps

format:
	mix format --check-formatted || mix format

force-format:
	find test -name '*.ex' -o -name '*.exs' | mix format --check-formatted || mix format
	find lib -name '*.ex' -o -name '*.exs' | mix format --check-formatted || mix format

gcdeps:
	mix deps.get && mix deps.compile

dev:
	MIX_ENV=dev iex -S mix

credo:
	mix credo --strict
