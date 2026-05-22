---
applyTo: "assets/**"
---

# Web Asset and Interactive Instructions

Apply these instructions when editing JavaScript, CSS/SCSS, images, data files, or interactive assets under `assets/`.

- Keep pedagogy first: interactive behavior should clarify a specific mathematical idea.
- Separate mathematical state, rendering, and user-interface logic where practical.
- Avoid fragile dependencies on rendered MathJax HTML when stable source data, IDs, or indices are available.
- Consider dark mode, responsive layout, and target PreTeXt/Runestone output behavior when relevant.
- Prefer small patches with clear test cases over full rewrites.
- For slideshow tooling, preserve JSON-based configuration, layout options, image caching, and top-level `dark-mode` class detection when relevant.
- For JSXGraph tools, keep board setup separate from slope/step/update logic and handle invalid input cleanly.
- Include manual test steps for the target output environment.