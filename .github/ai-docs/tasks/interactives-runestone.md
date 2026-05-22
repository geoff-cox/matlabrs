# Interactives, Runestone, JSXGraph, Parsons, and Slideshows Task Guide

Use this guide for interactive textbook components, JSXGraph tools, Euler’s method visualizations, Runestone integration, MicroParsons/hparsons work, slideshow tooling, or JavaScript/CSS debugging.

## Goal

Build interactive learning tools that clarify concepts while remaining maintainable inside the PreTeXt/Runestone ecosystem. Prioritize pedagogy first and implementation second.

## Design principles

An interactive should:

- focus on one conceptual goal;
- reveal structure progressively;
- give feedback that helps students revise their thinking;
- avoid overwhelming the learner with controls;
- make visual representations match the mathematical idea;
- remain robust under dark mode and responsive layouts when relevant.

## Runestone / PreTeXt integration

- Preserve generated IDs where possible.
- Avoid assumptions that hold in only one build target.
- Account for MathJax rendering timing.
- Avoid extracting mutable rendered HTML when stable IDs or source data are available.
- Test in the target output environment, not only in standalone HTML.

## MicroParsons and hparsons

Prefer designs that avoid grading based on mutated block HTML.

The preferred direction is to initialize with an array of block text in correct order, preserve stable block indices or IDs, grade using block ordering rather than fragile text extraction, support math mode without depending on rendered MathJax strings, and separate MicroParsons source changes from hparsons integration changes.

Relevant files may include `hparsons.js`, `BlockFeedback.js`, `micro-parsons.ts`, `ParsonsInput.ts`, `LoggingEvents.ts`, style files, and type definitions.

## Slideshow tooling

Support JSON-based configuration, optional layout selection, theme-aware behavior, dark-mode detection from a top-level `dark-mode` class, image caching, dynamic rendering inside PreTeXt, and performance-conscious event handling.

## Debugging style

When debugging interactive code:

1. identify the conceptual state model;
2. identify the rendering pipeline;
3. isolate whether the bug is state, rendering, layout, timing, or build integration;
4. propose a small patch;
5. give a test case.

Avoid rewriting the whole tool unless the architecture is the source of the bug.

## Quality checks

- The interaction supports the learning goal.
- Feedback is pedagogically meaningful.
- State and rendering are separated.
- Math display is robust.
- Dark mode and layout are considered when relevant.
- The patch can be tested locally.