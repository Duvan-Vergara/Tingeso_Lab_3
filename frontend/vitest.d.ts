/// <reference types="vitest" />
import type { UserConfig } from 'vite'
import type { InlineConfig } from 'vitest'

interface VitestConfig extends UserConfig {
  test?: InlineConfig
}

export { VitestConfig }
