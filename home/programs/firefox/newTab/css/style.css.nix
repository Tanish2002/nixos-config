theme:
with theme.config; ''
  @font-face {
      font-family: "${font1}";
      font-weight: "bold"
  }

  :root {
      --font: "${font1}";
      --background: #${bg};
      --foreground: #${fg};

      --pink: #${c4};
      --red: #${c9};
      --orange: #${c5};
      --branch: 1px solid #${c15};
  }

  html {
      font-size: 18px;
      font-weight: bold;
  }

  body {
      background: var(--background);
  }

  .container {
      position: absolute;
      top: 50%;
      left: 45%;
      transform: translate(-50%, -50%);
  }

  .prompt {
      font-family: var(--font);
      font-weight: bold;
      color: var(--foreground);
  }

  .prompt~.prompt {
      padding: 1.5rem 0 0.3125rem;
  }

  span {
      color: var(--pink);
  }

  .tree > ul {
      margin: 0;
      padding-left: 1rem;
  }

  ul {
      list-style: none;
      padding-left: 2.5rem;
  }

  li {
      position: relative;
  }

  li::before, li::after {
      content: "";
      position: absolute;
      left: -0.75rem;
  }

  li::before {
      border-top: var(--branch);
      top: 0.75rem;
      width: 0.5rem;
  }

  li::after {
      border-left: var(--branch);
      height: 100%;
      top: 0.25rem;
  }

  li:last-child::after {
      height: 0.5rem;
  }

  a {
      font-family: var(--font);
      font-size: 1rem;
      font-weight: bold;
      color: var(--foreground);
      text-decoration: none;
      outline: none;
  }

  a:hover {
      color: var(--background);
      background: var(--orange);
  }
  h1 {
      display: inline;
      font-family: var(--font);
      font-size: 1rem;
      font-weight: bold;
      color: var(--red);
  }

  form h1 {
      padding-left: 0.125rem;
  }

  input {
      font-family: var(--font);
      font-size: 1rem;
      font-weight: bold;
      color: var(--foreground);
      background-color: var(--background);
      border: none;
  }
''
