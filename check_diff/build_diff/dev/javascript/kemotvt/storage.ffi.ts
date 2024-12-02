//@ts-ignore
import { Ok, Error } from './gleam.mjs';

export function read_local_storage(key) {
    const value = window.localStorage.getItem(key)

    let string = JSON.parse(value!)

    console.log(string)

    return string ? new Ok(string) : new Error(undefined);
}

export function write_local_storage(key, value) {


    const value2 = JSON.stringify(value)

    window.localStorage.setItem(key, value2)
}