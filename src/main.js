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

// IMPORTS

import Elm from "./Main.elm";

// ELM

Elm.Main.init({
  node: document.getElementById("main")
});

// Fonts

const link = window.document.createElement("link");

link.setAttribute("rel", "stylesheet");
link.setAttribute("href", "https://fonts.googleapis.com/css2?family=Gideon+Roman&family=Playfair+Display&family=Roboto:wght@100;300;400&display=swap");

window.document.body.appendChild(link);

