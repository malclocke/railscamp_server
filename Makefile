gemmirror:
	gem mirror --config-file gem_mirrorrc mirror

gems/specs.4.8.gz: gems/gems
	cd gems && gem generate_index
