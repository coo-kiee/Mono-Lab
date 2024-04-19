# Mono-Lab

#### Labs for proof of concept and implementation

## Start

```
# yarn dlx @yarnpkg/sdks vscode

$ yarn example

// print
app: yarn app tsconfig echo
package: yarn package tsconfig echo
all: yarn all echo
all-app: yarn all-app echo
all-package: yarn all-package echo
add-workspace: yarn add-workspace test
```

####

##

### Package Manager

#### - Yarn Berry v3.8.0

##

### Require Extension

#### - ZipFS

#### - ESLint

#### - Prettier

##

### Apps/Packages Naming Rule

#### Apps

```
// package.json
{
    ...,
    name: "@apps/{name}"
}
```

#### Packages

```
// package.json
{
    ...,
    name: "@packages/{name}"
}
```

##

### Commit Message Convension

#### Title

- repositoryName (Option) - `Calmel Case`, `Required` when it is one
- Type - `Calmel Case`, `Add/Mod/Del/HotFix`
- Subject (Option) - `Required` when no body is present

```
[repositoryName]/[Type] Subject

ex.
[Tsconfig]/[Add] base.json 추가
```

#### Body

- repositoryName - `Calmel Case`
- Type
- Explain

```
[Type] Subject
  - [repositoryName1]/[Type] Explain
  - [repositoryName2]/[Type] Explain
  ...

ex.
[Add/Mod] 초기설정
  - [Tsconfig]/[Add] base.json 추가
  - [Eslint-Config-Custom]/[Mod] javascript 설정 변경
    - airbnb-base 추가
    - ignorePatterns 수정

```

##

### CLI History

#### Yarn Berry Workspaces

#### $ yarn set version 3.x

#### $ yarn add -D @types/node typescript prettier eslint@^8.2.0

#### $ yarn dlx @yarnpkg/sdks vscode

- [A CLI tool designed for generating and updating Editor SDKs and settings.](https://www.npmjs.com/package/@yarnpkg/sdks)

#### $ yarn plugin import typescript

- [Automatically adds @types/ packages into your dependencies when you add a package that doesn't include its own types](https://www.npmjs.com/package/@yarnpkg/plugin-typescript)

#### $ yarn plugin import workspace-tools

- For use

```
$ yarn workspaces focus
$ yarn workspaces foreach
```

- [This plugin is included by default starting from Yarn 4.](https://www.npmjs.com/package/@yarnpkg/plugin-workspace-tools)

#### $ mkdir apps packages

#### Create Config

- eslint-config-custom

  #### $ cd packages

  #### $ mkdir eslint-config-custom

  #### $ cd eslint-config-custom

  #### $ yarn init

  #### $ npm info "eslint-config-airbnb@latest" peerDependencies

  #### $ yarn add -D eslint@^8.2.0 eslint-plugin-import@^2.25.3 eslint-import-resolver-typescript eslint-plugin-jsx-a11y@^6.5.1 eslint-plugin-react@^7.28.0 eslint-plugin-react-hooks@^4.3.0

  #### $ yarn add -D eslint-config-airbnb-base eslint-config-airbnb

  #### $ yarn add -D @typescript-eslint/eslint-plugin@^6.0.0 @typescript-eslint/parser@^6.0.0 eslint-config-airbnb-typescript

  #### $ yarn add -D eslint-config-prettier

- tsconfig

  #### $ cd packages

  #### $ mkdir tsconfig

  #### $ cd tsconfig

  #### $ yarn init
