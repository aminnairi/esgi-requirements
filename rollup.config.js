/*
 * Website allowing interviewee to be assessed with pre-requisites for joining the ESGI. 
 * Copyright (C) 2022 Amin NAIRI
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import {createHtml} from "@aminnairi/rollup-plugin-create-html";
import {terser} from "rollup-plugin-terser";
import elm from "rollup-plugin-elm";
import livereload from "rollup-plugin-livereload";
import serve from "rollup-plugin-serve";
import replace from "rollup-plugin-replace";
import copy from "rollup-plugin-copy";
import remove from "rollup-plugin-delete";

const isDevelopment = process.env.NODE_ENV === "development";
const isProduction = process.env.NODE_ENV === "production";

const serverPort = Number(process.env.SERVER_PORT || "8000") || 8000;
const serverHost = process.env.SERVER_HOST || "0.0.0.0";
const livereloadPort = Number(process.env.LIVERELOAD_PORT || "12345") || 12345;

export default {
  input: "src/main.js",
  plugins: [
    remove({
      targets: "docs/*",
      verbose: true,
      runOnce: isDevelopment
    }),
    copy({
      verbose: true,
      copyOnce: isDevelopment,
      flatten: true,
      targets: [
        {
          src: "assets/*",
          dest: "docs"
        }
      ]
    }),
    elm({
      compiler: {
        optimize: isProduction,
        debug: isDevelopment
      }
    }),
    createHtml({
      name: "index.html",
      path: ".",
      doctype: "<!DOCTYPE html>",
      root: {
        name: "html",
        attributes: {
          lang: "fr-FR"
        },
        children: [
          {
            name: "head",
            children: [
              { name: "meta", attributes: { charset: "UTF-8" } },
              { name: "meta", attributes: { name: "description", content: "Site internet à destination des intervenants permettant de connaître les pré-requis à maîtriser par les étudiants souhaitant rejoindre l'ESGI." } },
              { name: "meta", attributes: { name: "viewport", content: "width=device-width, initial-scale=1.0" } },
              { name: "meta", attributes: { name: "theme-color", content: "#ffffff" } },
              { name: "link", attributes: { rel: "preconnect", href: "https://fonts.googleapis.com" } },
              { name: "link", attributes: { rel: "preconnect", href: "https://fonts.gstatic.com" } },
              { name: "link", attributes: { rel: "preload", href: "https://fonts.googleapis.com/css2?family=Gideon+Roman&family=Playfair+Display&family=Roboto:wght@100;300;400&display=swap", as: "style" } },
              { name: "link", attributes: { rel: "manifest", href: "manifest.webmanifest" } },
              { name: "link", attributes: { rel: "icon", href: "logo.png" } },
              { name: "link", attributes: { rel: "apple-touch-icon", href: "logo.png" } },
              { name: "title", children: ["ESGI — Pré-requis"] }
            ]
          },
          {
            name: "body",
            children: [
              { name: "div", attributes: { id: "main" }, children: [] },
              { name: "script", attributes: { src: "main.js", async: true, defer: true }, children: [] }
            ]
          }
        ]
      }
    }),
    isDevelopment && serve({
      contentBase: [
        "docs"
      ],
      historyApiFallback: true,
      port: serverPort,
      host: serverHost
    }),
    isDevelopment && livereload({
      port: livereloadPort
    }),
    isProduction && replace({
      preventAssignment: true,
      "process.env.NODE_ENV": JSON.stringify("production")
    }),
    isProduction && terser({
      compress: {
        toplevel: true,
        booleans_as_integers: true,
        drop_console: true,
        drop_debugger: true,
        unsafe_comps: true,
        unsafe: true,
        pure_getters: true,
        pure_funcs: [
          "F2",
          "F3",
          "F4",
          "F5",
          "F6",
          "F7",
          "F8",
          "F9",
          "A2",
          "A3",
          "A4",
          "A5",
          "A6",
          "A7",
          "A8",
          "A9"
        ],
        keep_fargs: false
      }
    })
  ],
  output: {
    file: "docs/main.js",
    format: "iife"
  }
};
