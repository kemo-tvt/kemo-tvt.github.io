var __defProp = Object.defineProperty;
var __typeError = (msg) => {
  throw TypeError(msg);
};
var __defNormalProp = (obj, key, value2) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value: value2 }) : obj[key] = value2;
var __publicField = (obj, key, value2) => __defNormalProp(obj, typeof key !== "symbol" ? key + "" : key, value2);
var __accessCheck = (obj, member, msg) => member.has(obj) || __typeError("Cannot " + msg);
var __privateGet = (obj, member, getter) => (__accessCheck(obj, member, "read from private field"), getter ? getter.call(obj) : member.get(obj));
var __privateAdd = (obj, member, value2) => member.has(obj) ? __typeError("Cannot add the same private member more than once") : member instanceof WeakSet ? member.add(obj) : member.set(obj, value2);
var __privateSet = (obj, member, value2, setter) => (__accessCheck(obj, member, "write to private field"), setter ? setter.call(obj, value2) : member.set(obj, value2), value2);
var __privateMethod = (obj, member, method) => (__accessCheck(obj, member, "access private method"), method);
var _current, _model, _update, _view, _queue, _tickScheduled, _LustreClientApplication_instances, tick_fn, flush_fn;
(function polyfill() {
  const relList = document.createElement("link").relList;
  if (relList && relList.supports && relList.supports("modulepreload")) {
    return;
  }
  for (const link of document.querySelectorAll('link[rel="modulepreload"]')) {
    processPreload(link);
  }
  new MutationObserver((mutations) => {
    for (const mutation of mutations) {
      if (mutation.type !== "childList") {
        continue;
      }
      for (const node2 of mutation.addedNodes) {
        if (node2.tagName === "LINK" && node2.rel === "modulepreload")
          processPreload(node2);
      }
    }
  }).observe(document, { childList: true, subtree: true });
  function getFetchOpts(link) {
    const fetchOpts = {};
    if (link.integrity) fetchOpts.integrity = link.integrity;
    if (link.referrerPolicy) fetchOpts.referrerPolicy = link.referrerPolicy;
    if (link.crossOrigin === "use-credentials")
      fetchOpts.credentials = "include";
    else if (link.crossOrigin === "anonymous") fetchOpts.credentials = "omit";
    else fetchOpts.credentials = "same-origin";
    return fetchOpts;
  }
  function processPreload(link) {
    if (link.ep)
      return;
    link.ep = true;
    const fetchOpts = getFetchOpts(link);
    fetch(link.href, fetchOpts);
  }
})();
class CustomType {
  withFields(fields) {
    let properties = Object.keys(this).map(
      (label) => label in fields ? fields[label] : this[label]
    );
    return new this.constructor(...properties);
  }
}
class List {
  static fromArray(array, tail) {
    let t = tail || new Empty();
    for (let i = array.length - 1; i >= 0; --i) {
      t = new NonEmpty(array[i], t);
    }
    return t;
  }
  [Symbol.iterator]() {
    return new ListIterator(this);
  }
  toArray() {
    return [...this];
  }
  // @internal
  atLeastLength(desired) {
    for (let _ of this) {
      if (desired <= 0) return true;
      desired--;
    }
    return desired <= 0;
  }
  // @internal
  hasLength(desired) {
    for (let _ of this) {
      if (desired <= 0) return false;
      desired--;
    }
    return desired === 0;
  }
  // @internal
  countLength() {
    let length = 0;
    for (let _ of this) length++;
    return length;
  }
}
function prepend$1(element2, tail) {
  return new NonEmpty(element2, tail);
}
function toList(elements, tail) {
  return List.fromArray(elements, tail);
}
class ListIterator {
  constructor(current) {
    __privateAdd(this, _current);
    __privateSet(this, _current, current);
  }
  next() {
    if (__privateGet(this, _current) instanceof Empty) {
      return { done: true };
    } else {
      let { head, tail } = __privateGet(this, _current);
      __privateSet(this, _current, tail);
      return { value: head, done: false };
    }
  }
}
_current = new WeakMap();
class Empty extends List {
}
class NonEmpty extends List {
  constructor(head, tail) {
    super();
    this.head = head;
    this.tail = tail;
  }
}
class BitArray {
  constructor(buffer) {
    if (!(buffer instanceof Uint8Array)) {
      throw "BitArray can only be constructed from a Uint8Array";
    }
    this.buffer = buffer;
  }
  // @internal
  get length() {
    return this.buffer.length;
  }
  // @internal
  byteAt(index2) {
    return this.buffer[index2];
  }
  // @internal
  floatFromSlice(start2, end, isBigEndian) {
    return byteArrayToFloat(this.buffer, start2, end, isBigEndian);
  }
  // @internal
  intFromSlice(start2, end, isBigEndian, isSigned) {
    return byteArrayToInt(this.buffer, start2, end, isBigEndian, isSigned);
  }
  // @internal
  binaryFromSlice(start2, end) {
    return new BitArray(this.buffer.slice(start2, end));
  }
  // @internal
  sliceAfter(index2) {
    return new BitArray(this.buffer.slice(index2));
  }
}
class UtfCodepoint {
  constructor(value2) {
    this.value = value2;
  }
}
function byteArrayToInt(byteArray, start2, end, isBigEndian, isSigned) {
  const byteSize = end - start2;
  if (byteSize <= 6) {
    let value2 = 0;
    if (isBigEndian) {
      for (let i = start2; i < end; i++) {
        value2 = value2 * 256 + byteArray[i];
      }
    } else {
      for (let i = end - 1; i >= start2; i--) {
        value2 = value2 * 256 + byteArray[i];
      }
    }
    if (isSigned) {
      const highBit = 2 ** (byteSize * 8 - 1);
      if (value2 >= highBit) {
        value2 -= highBit * 2;
      }
    }
    return value2;
  } else {
    let value2 = 0n;
    if (isBigEndian) {
      for (let i = start2; i < end; i++) {
        value2 = (value2 << 8n) + BigInt(byteArray[i]);
      }
    } else {
      for (let i = end - 1; i >= start2; i--) {
        value2 = (value2 << 8n) + BigInt(byteArray[i]);
      }
    }
    if (isSigned) {
      const highBit = 1n << BigInt(byteSize * 8 - 1);
      if (value2 >= highBit) {
        value2 -= highBit * 2n;
      }
    }
    return Number(value2);
  }
}
function byteArrayToFloat(byteArray, start2, end, isBigEndian) {
  const view2 = new DataView(byteArray.buffer);
  const byteSize = end - start2;
  if (byteSize === 8) {
    return view2.getFloat64(start2, !isBigEndian);
  } else if (byteSize === 4) {
    return view2.getFloat32(start2, !isBigEndian);
  } else {
    const msg = `Sized floats must be 32-bit or 64-bit on JavaScript, got size of ${byteSize * 8} bits`;
    throw new globalThis.Error(msg);
  }
}
class Result extends CustomType {
  // @internal
  static isResult(data) {
    return data instanceof Result;
  }
}
class Ok extends Result {
  constructor(value2) {
    super();
    this[0] = value2;
  }
  // @internal
  isOk() {
    return true;
  }
}
class Error2 extends Result {
  constructor(detail) {
    super();
    this[0] = detail;
  }
  // @internal
  isOk() {
    return false;
  }
}
function isEqual(x, y) {
  let values2 = [x, y];
  while (values2.length) {
    let a = values2.pop();
    let b = values2.pop();
    if (a === b) continue;
    if (!isObject(a) || !isObject(b)) return false;
    let unequal = !structurallyCompatibleObjects(a, b) || unequalDates(a, b) || unequalBuffers(a, b) || unequalArrays(a, b) || unequalMaps(a, b) || unequalSets(a, b) || unequalRegExps(a, b);
    if (unequal) return false;
    const proto = Object.getPrototypeOf(a);
    if (proto !== null && typeof proto.equals === "function") {
      try {
        if (a.equals(b)) continue;
        else return false;
      } catch {
      }
    }
    let [keys, get2] = getters(a);
    for (let k of keys(a)) {
      values2.push(get2(a, k), get2(b, k));
    }
  }
  return true;
}
function getters(object) {
  if (object instanceof Map) {
    return [(x) => x.keys(), (x, y) => x.get(y)];
  } else {
    let extra = object instanceof globalThis.Error ? ["message"] : [];
    return [(x) => [...extra, ...Object.keys(x)], (x, y) => x[y]];
  }
}
function unequalDates(a, b) {
  return a instanceof Date && (a > b || a < b);
}
function unequalBuffers(a, b) {
  return a.buffer instanceof ArrayBuffer && a.BYTES_PER_ELEMENT && !(a.byteLength === b.byteLength && a.every((n, i) => n === b[i]));
}
function unequalArrays(a, b) {
  return Array.isArray(a) && a.length !== b.length;
}
function unequalMaps(a, b) {
  return a instanceof Map && a.size !== b.size;
}
function unequalSets(a, b) {
  return a instanceof Set && (a.size != b.size || [...a].some((e) => !b.has(e)));
}
function unequalRegExps(a, b) {
  return a instanceof RegExp && (a.source !== b.source || a.flags !== b.flags);
}
function isObject(a) {
  return typeof a === "object" && a !== null;
}
function structurallyCompatibleObjects(a, b) {
  if (typeof a !== "object" && typeof b !== "object" && (!a || !b))
    return false;
  let nonstructural = [Promise, WeakSet, WeakMap, Function];
  if (nonstructural.some((c) => a instanceof c)) return false;
  return a.constructor === b.constructor;
}
function makeError(variant, module, line, fn, message, extra) {
  let error = new globalThis.Error(message);
  error.gleam_error = variant;
  error.module = module;
  error.line = line;
  error.function = fn;
  error.fn = fn;
  for (let k in extra) error[k] = extra[k];
  return error;
}
function toArray(list) {
  return list.toArray();
}
function reduceRight(thing, acc, fn) {
  return thing.reduceRight(fn, acc);
}
function index$1(thing, index2) {
  return index2 in thing ? new Ok(thing[index2]) : new Error2(void 0);
}
function to_list(items) {
  return reduceRight(
    items,
    toList([]),
    (list, item) => {
      return prepend$1(item, list);
    }
  );
}
class Some extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class None extends CustomType {
}
function to_result(option, e) {
  if (option instanceof Some) {
    let a = option[0];
    return new Ok(a);
  } else {
    return new Error2(e);
  }
}
function unwrap(option, default$) {
  if (option instanceof Some) {
    let x = option[0];
    return x;
  } else {
    return default$;
  }
}
function lazy_unwrap$1(option, default$) {
  if (option instanceof Some) {
    let x = option[0];
    return x;
  } else {
    return default$();
  }
}
function map$2(option, fun) {
  if (option instanceof Some) {
    let x = option[0];
    return new Some(fun(x));
  } else {
    return new None();
  }
}
const referenceMap = /* @__PURE__ */ new WeakMap();
const tempDataView = new DataView(new ArrayBuffer(8));
let referenceUID = 0;
function hashByReference(o) {
  const known = referenceMap.get(o);
  if (known !== void 0) {
    return known;
  }
  const hash = referenceUID++;
  if (referenceUID === 2147483647) {
    referenceUID = 0;
  }
  referenceMap.set(o, hash);
  return hash;
}
function hashMerge(a, b) {
  return a ^ b + 2654435769 + (a << 6) + (a >> 2) | 0;
}
function hashString(s) {
  let hash = 0;
  const len = s.length;
  for (let i = 0; i < len; i++) {
    hash = Math.imul(31, hash) + s.charCodeAt(i) | 0;
  }
  return hash;
}
function hashNumber(n) {
  tempDataView.setFloat64(0, n);
  const i = tempDataView.getInt32(0);
  const j = tempDataView.getInt32(4);
  return Math.imul(73244475, i >> 16 ^ i) ^ j;
}
function hashBigInt(n) {
  return hashString(n.toString());
}
function hashObject(o) {
  const proto = Object.getPrototypeOf(o);
  if (proto !== null && typeof proto.hashCode === "function") {
    try {
      const code = o.hashCode(o);
      if (typeof code === "number") {
        return code;
      }
    } catch {
    }
  }
  if (o instanceof Promise || o instanceof WeakSet || o instanceof WeakMap) {
    return hashByReference(o);
  }
  if (o instanceof Date) {
    return hashNumber(o.getTime());
  }
  let h = 0;
  if (o instanceof ArrayBuffer) {
    o = new Uint8Array(o);
  }
  if (Array.isArray(o) || o instanceof Uint8Array) {
    for (let i = 0; i < o.length; i++) {
      h = Math.imul(31, h) + getHash(o[i]) | 0;
    }
  } else if (o instanceof Set) {
    o.forEach((v) => {
      h = h + getHash(v) | 0;
    });
  } else if (o instanceof Map) {
    o.forEach((v, k) => {
      h = h + hashMerge(getHash(v), getHash(k)) | 0;
    });
  } else {
    const keys = Object.keys(o);
    for (let i = 0; i < keys.length; i++) {
      const k = keys[i];
      const v = o[k];
      h = h + hashMerge(getHash(v), hashString(k)) | 0;
    }
  }
  return h;
}
function getHash(u) {
  if (u === null) return 1108378658;
  if (u === void 0) return 1108378659;
  if (u === true) return 1108378657;
  if (u === false) return 1108378656;
  switch (typeof u) {
    case "number":
      return hashNumber(u);
    case "string":
      return hashString(u);
    case "bigint":
      return hashBigInt(u);
    case "object":
      return hashObject(u);
    case "symbol":
      return hashByReference(u);
    case "function":
      return hashByReference(u);
    default:
      return 0;
  }
}
const SHIFT = 5;
const BUCKET_SIZE = Math.pow(2, SHIFT);
const MASK = BUCKET_SIZE - 1;
const MAX_INDEX_NODE = BUCKET_SIZE / 2;
const MIN_ARRAY_NODE = BUCKET_SIZE / 4;
const ENTRY = 0;
const ARRAY_NODE = 1;
const INDEX_NODE = 2;
const COLLISION_NODE = 3;
const EMPTY = {
  type: INDEX_NODE,
  bitmap: 0,
  array: []
};
function mask(hash, shift) {
  return hash >>> shift & MASK;
}
function bitpos(hash, shift) {
  return 1 << mask(hash, shift);
}
function bitcount(x) {
  x -= x >> 1 & 1431655765;
  x = (x & 858993459) + (x >> 2 & 858993459);
  x = x + (x >> 4) & 252645135;
  x += x >> 8;
  x += x >> 16;
  return x & 127;
}
function index(bitmap, bit) {
  return bitcount(bitmap & bit - 1);
}
function cloneAndSet(arr, at, val) {
  const len = arr.length;
  const out = new Array(len);
  for (let i = 0; i < len; ++i) {
    out[i] = arr[i];
  }
  out[at] = val;
  return out;
}
function spliceIn(arr, at, val) {
  const len = arr.length;
  const out = new Array(len + 1);
  let i = 0;
  let g = 0;
  while (i < at) {
    out[g++] = arr[i++];
  }
  out[g++] = val;
  while (i < len) {
    out[g++] = arr[i++];
  }
  return out;
}
function spliceOut(arr, at) {
  const len = arr.length;
  const out = new Array(len - 1);
  let i = 0;
  let g = 0;
  while (i < at) {
    out[g++] = arr[i++];
  }
  ++i;
  while (i < len) {
    out[g++] = arr[i++];
  }
  return out;
}
function createNode(shift, key1, val1, key2hash, key2, val2) {
  const key1hash = getHash(key1);
  if (key1hash === key2hash) {
    return {
      type: COLLISION_NODE,
      hash: key1hash,
      array: [
        { type: ENTRY, k: key1, v: val1 },
        { type: ENTRY, k: key2, v: val2 }
      ]
    };
  }
  const addedLeaf = { val: false };
  return assoc(
    assocIndex(EMPTY, shift, key1hash, key1, val1, addedLeaf),
    shift,
    key2hash,
    key2,
    val2,
    addedLeaf
  );
}
function assoc(root, shift, hash, key, val, addedLeaf) {
  switch (root.type) {
    case ARRAY_NODE:
      return assocArray(root, shift, hash, key, val, addedLeaf);
    case INDEX_NODE:
      return assocIndex(root, shift, hash, key, val, addedLeaf);
    case COLLISION_NODE:
      return assocCollision(root, shift, hash, key, val, addedLeaf);
  }
}
function assocArray(root, shift, hash, key, val, addedLeaf) {
  const idx = mask(hash, shift);
  const node2 = root.array[idx];
  if (node2 === void 0) {
    addedLeaf.val = true;
    return {
      type: ARRAY_NODE,
      size: root.size + 1,
      array: cloneAndSet(root.array, idx, { type: ENTRY, k: key, v: val })
    };
  }
  if (node2.type === ENTRY) {
    if (isEqual(key, node2.k)) {
      if (val === node2.v) {
        return root;
      }
      return {
        type: ARRAY_NODE,
        size: root.size,
        array: cloneAndSet(root.array, idx, {
          type: ENTRY,
          k: key,
          v: val
        })
      };
    }
    addedLeaf.val = true;
    return {
      type: ARRAY_NODE,
      size: root.size,
      array: cloneAndSet(
        root.array,
        idx,
        createNode(shift + SHIFT, node2.k, node2.v, hash, key, val)
      )
    };
  }
  const n = assoc(node2, shift + SHIFT, hash, key, val, addedLeaf);
  if (n === node2) {
    return root;
  }
  return {
    type: ARRAY_NODE,
    size: root.size,
    array: cloneAndSet(root.array, idx, n)
  };
}
function assocIndex(root, shift, hash, key, val, addedLeaf) {
  const bit = bitpos(hash, shift);
  const idx = index(root.bitmap, bit);
  if ((root.bitmap & bit) !== 0) {
    const node2 = root.array[idx];
    if (node2.type !== ENTRY) {
      const n = assoc(node2, shift + SHIFT, hash, key, val, addedLeaf);
      if (n === node2) {
        return root;
      }
      return {
        type: INDEX_NODE,
        bitmap: root.bitmap,
        array: cloneAndSet(root.array, idx, n)
      };
    }
    const nodeKey = node2.k;
    if (isEqual(key, nodeKey)) {
      if (val === node2.v) {
        return root;
      }
      return {
        type: INDEX_NODE,
        bitmap: root.bitmap,
        array: cloneAndSet(root.array, idx, {
          type: ENTRY,
          k: key,
          v: val
        })
      };
    }
    addedLeaf.val = true;
    return {
      type: INDEX_NODE,
      bitmap: root.bitmap,
      array: cloneAndSet(
        root.array,
        idx,
        createNode(shift + SHIFT, nodeKey, node2.v, hash, key, val)
      )
    };
  } else {
    const n = root.array.length;
    if (n >= MAX_INDEX_NODE) {
      const nodes = new Array(32);
      const jdx = mask(hash, shift);
      nodes[jdx] = assocIndex(EMPTY, shift + SHIFT, hash, key, val, addedLeaf);
      let j = 0;
      let bitmap = root.bitmap;
      for (let i = 0; i < 32; i++) {
        if ((bitmap & 1) !== 0) {
          const node2 = root.array[j++];
          nodes[i] = node2;
        }
        bitmap = bitmap >>> 1;
      }
      return {
        type: ARRAY_NODE,
        size: n + 1,
        array: nodes
      };
    } else {
      const newArray = spliceIn(root.array, idx, {
        type: ENTRY,
        k: key,
        v: val
      });
      addedLeaf.val = true;
      return {
        type: INDEX_NODE,
        bitmap: root.bitmap | bit,
        array: newArray
      };
    }
  }
}
function assocCollision(root, shift, hash, key, val, addedLeaf) {
  if (hash === root.hash) {
    const idx = collisionIndexOf(root, key);
    if (idx !== -1) {
      const entry = root.array[idx];
      if (entry.v === val) {
        return root;
      }
      return {
        type: COLLISION_NODE,
        hash,
        array: cloneAndSet(root.array, idx, { type: ENTRY, k: key, v: val })
      };
    }
    const size = root.array.length;
    addedLeaf.val = true;
    return {
      type: COLLISION_NODE,
      hash,
      array: cloneAndSet(root.array, size, { type: ENTRY, k: key, v: val })
    };
  }
  return assoc(
    {
      type: INDEX_NODE,
      bitmap: bitpos(root.hash, shift),
      array: [root]
    },
    shift,
    hash,
    key,
    val,
    addedLeaf
  );
}
function collisionIndexOf(root, key) {
  const size = root.array.length;
  for (let i = 0; i < size; i++) {
    if (isEqual(key, root.array[i].k)) {
      return i;
    }
  }
  return -1;
}
function find(root, shift, hash, key) {
  switch (root.type) {
    case ARRAY_NODE:
      return findArray(root, shift, hash, key);
    case INDEX_NODE:
      return findIndex(root, shift, hash, key);
    case COLLISION_NODE:
      return findCollision(root, key);
  }
}
function findArray(root, shift, hash, key) {
  const idx = mask(hash, shift);
  const node2 = root.array[idx];
  if (node2 === void 0) {
    return void 0;
  }
  if (node2.type !== ENTRY) {
    return find(node2, shift + SHIFT, hash, key);
  }
  if (isEqual(key, node2.k)) {
    return node2;
  }
  return void 0;
}
function findIndex(root, shift, hash, key) {
  const bit = bitpos(hash, shift);
  if ((root.bitmap & bit) === 0) {
    return void 0;
  }
  const idx = index(root.bitmap, bit);
  const node2 = root.array[idx];
  if (node2.type !== ENTRY) {
    return find(node2, shift + SHIFT, hash, key);
  }
  if (isEqual(key, node2.k)) {
    return node2;
  }
  return void 0;
}
function findCollision(root, key) {
  const idx = collisionIndexOf(root, key);
  if (idx < 0) {
    return void 0;
  }
  return root.array[idx];
}
function without(root, shift, hash, key) {
  switch (root.type) {
    case ARRAY_NODE:
      return withoutArray(root, shift, hash, key);
    case INDEX_NODE:
      return withoutIndex(root, shift, hash, key);
    case COLLISION_NODE:
      return withoutCollision(root, key);
  }
}
function withoutArray(root, shift, hash, key) {
  const idx = mask(hash, shift);
  const node2 = root.array[idx];
  if (node2 === void 0) {
    return root;
  }
  let n = void 0;
  if (node2.type === ENTRY) {
    if (!isEqual(node2.k, key)) {
      return root;
    }
  } else {
    n = without(node2, shift + SHIFT, hash, key);
    if (n === node2) {
      return root;
    }
  }
  if (n === void 0) {
    if (root.size <= MIN_ARRAY_NODE) {
      const arr = root.array;
      const out = new Array(root.size - 1);
      let i = 0;
      let j = 0;
      let bitmap = 0;
      while (i < idx) {
        const nv = arr[i];
        if (nv !== void 0) {
          out[j] = nv;
          bitmap |= 1 << i;
          ++j;
        }
        ++i;
      }
      ++i;
      while (i < arr.length) {
        const nv = arr[i];
        if (nv !== void 0) {
          out[j] = nv;
          bitmap |= 1 << i;
          ++j;
        }
        ++i;
      }
      return {
        type: INDEX_NODE,
        bitmap,
        array: out
      };
    }
    return {
      type: ARRAY_NODE,
      size: root.size - 1,
      array: cloneAndSet(root.array, idx, n)
    };
  }
  return {
    type: ARRAY_NODE,
    size: root.size,
    array: cloneAndSet(root.array, idx, n)
  };
}
function withoutIndex(root, shift, hash, key) {
  const bit = bitpos(hash, shift);
  if ((root.bitmap & bit) === 0) {
    return root;
  }
  const idx = index(root.bitmap, bit);
  const node2 = root.array[idx];
  if (node2.type !== ENTRY) {
    const n = without(node2, shift + SHIFT, hash, key);
    if (n === node2) {
      return root;
    }
    if (n !== void 0) {
      return {
        type: INDEX_NODE,
        bitmap: root.bitmap,
        array: cloneAndSet(root.array, idx, n)
      };
    }
    if (root.bitmap === bit) {
      return void 0;
    }
    return {
      type: INDEX_NODE,
      bitmap: root.bitmap ^ bit,
      array: spliceOut(root.array, idx)
    };
  }
  if (isEqual(key, node2.k)) {
    if (root.bitmap === bit) {
      return void 0;
    }
    return {
      type: INDEX_NODE,
      bitmap: root.bitmap ^ bit,
      array: spliceOut(root.array, idx)
    };
  }
  return root;
}
function withoutCollision(root, key) {
  const idx = collisionIndexOf(root, key);
  if (idx < 0) {
    return root;
  }
  if (root.array.length === 1) {
    return void 0;
  }
  return {
    type: COLLISION_NODE,
    hash: root.hash,
    array: spliceOut(root.array, idx)
  };
}
function forEach(root, fn) {
  if (root === void 0) {
    return;
  }
  const items = root.array;
  const size = items.length;
  for (let i = 0; i < size; i++) {
    const item = items[i];
    if (item === void 0) {
      continue;
    }
    if (item.type === ENTRY) {
      fn(item.v, item.k);
      continue;
    }
    forEach(item, fn);
  }
}
class Dict {
  /**
   * @template V
   * @param {Record<string,V>} o
   * @returns {Dict<string,V>}
   */
  static fromObject(o) {
    const keys = Object.keys(o);
    let m = Dict.new();
    for (let i = 0; i < keys.length; i++) {
      const k = keys[i];
      m = m.set(k, o[k]);
    }
    return m;
  }
  /**
   * @template K,V
   * @param {Map<K,V>} o
   * @returns {Dict<K,V>}
   */
  static fromMap(o) {
    let m = Dict.new();
    o.forEach((v, k) => {
      m = m.set(k, v);
    });
    return m;
  }
  static new() {
    return new Dict(void 0, 0);
  }
  /**
   * @param {undefined | Node<K,V>} root
   * @param {number} size
   */
  constructor(root, size) {
    this.root = root;
    this.size = size;
  }
  /**
   * @template NotFound
   * @param {K} key
   * @param {NotFound} notFound
   * @returns {NotFound | V}
   */
  get(key, notFound) {
    if (this.root === void 0) {
      return notFound;
    }
    const found = find(this.root, 0, getHash(key), key);
    if (found === void 0) {
      return notFound;
    }
    return found.v;
  }
  /**
   * @param {K} key
   * @param {V} val
   * @returns {Dict<K,V>}
   */
  set(key, val) {
    const addedLeaf = { val: false };
    const root = this.root === void 0 ? EMPTY : this.root;
    const newRoot = assoc(root, 0, getHash(key), key, val, addedLeaf);
    if (newRoot === this.root) {
      return this;
    }
    return new Dict(newRoot, addedLeaf.val ? this.size + 1 : this.size);
  }
  /**
   * @param {K} key
   * @returns {Dict<K,V>}
   */
  delete(key) {
    if (this.root === void 0) {
      return this;
    }
    const newRoot = without(this.root, 0, getHash(key), key);
    if (newRoot === this.root) {
      return this;
    }
    if (newRoot === void 0) {
      return Dict.new();
    }
    return new Dict(newRoot, this.size - 1);
  }
  /**
   * @param {K} key
   * @returns {boolean}
   */
  has(key) {
    if (this.root === void 0) {
      return false;
    }
    return find(this.root, 0, getHash(key), key) !== void 0;
  }
  /**
   * @returns {[K,V][]}
   */
  entries() {
    if (this.root === void 0) {
      return [];
    }
    const result = [];
    this.forEach((v, k) => result.push([k, v]));
    return result;
  }
  /**
   *
   * @param {(val:V,key:K)=>void} fn
   */
  forEach(fn) {
    forEach(this.root, fn);
  }
  hashCode() {
    let h = 0;
    this.forEach((v, k) => {
      h = h + hashMerge(getHash(v), getHash(k)) | 0;
    });
    return h;
  }
  /**
   * @param {unknown} o
   * @returns {boolean}
   */
  equals(o) {
    if (!(o instanceof Dict) || this.size !== o.size) {
      return false;
    }
    let equal = true;
    this.forEach((v, k) => {
      equal = equal && isEqual(o.get(k, !v), v);
    });
    return equal;
  }
}
const Nil = void 0;
const NOT_FOUND = {};
function identity(x) {
  return x;
}
function to_string$4(term) {
  return term.toString();
}
function float_to_string(float) {
  const string2 = float.toString().replace("+", "");
  if (string2.indexOf(".") >= 0) {
    return string2;
  } else {
    const index2 = string2.indexOf("e");
    if (index2 >= 0) {
      return string2.slice(0, index2) + ".0" + string2.slice(index2);
    } else {
      return string2 + ".0";
    }
  }
}
function add(a, b) {
  return a + b;
}
function join$1(xs, separator) {
  const iterator = xs[Symbol.iterator]();
  let result = iterator.next().value || "";
  let current = iterator.next();
  while (!current.done) {
    result = result + separator + current.value;
    current = iterator.next();
  }
  return result;
}
function concat(xs) {
  let result = "";
  for (const x of xs) {
    result = result + x;
  }
  return result;
}
function new_map() {
  return Dict.new();
}
function map_to_list(map2) {
  return List.fromArray(map2.entries());
}
function map_get(map2, key) {
  const value2 = map2.get(key, NOT_FOUND);
  if (value2 === NOT_FOUND) {
    return new Error2(Nil);
  }
  return new Ok(value2);
}
function map_insert(key, value2, map2) {
  return map2.set(key, value2);
}
function classify_dynamic(data) {
  if (typeof data === "string") {
    return "String";
  } else if (typeof data === "boolean") {
    return "Bool";
  } else if (data instanceof Result) {
    return "Result";
  } else if (data instanceof List) {
    return "List";
  } else if (data instanceof BitArray) {
    return "BitArray";
  } else if (data instanceof Dict) {
    return "Dict";
  } else if (Number.isInteger(data)) {
    return "Int";
  } else if (Array.isArray(data)) {
    return `Tuple of ${data.length} elements`;
  } else if (typeof data === "number") {
    return "Float";
  } else if (data === null) {
    return "Null";
  } else if (data === void 0) {
    return "Nil";
  } else {
    const type = typeof data;
    return type.charAt(0).toUpperCase() + type.slice(1);
  }
}
function decoder_error(expected, got) {
  return decoder_error_no_classify(expected, classify_dynamic(got));
}
function decoder_error_no_classify(expected, got) {
  return new Error2(
    List.fromArray([new DecodeError(expected, got, List.fromArray([]))])
  );
}
function decode_string(data) {
  return typeof data === "string" ? new Ok(data) : decoder_error("String", data);
}
function decode_int(data) {
  return Number.isInteger(data) ? new Ok(data) : decoder_error("Int", data);
}
function decode_field(value2, name) {
  const not_a_map_error = () => decoder_error("Dict", value2);
  if (value2 instanceof Dict || value2 instanceof WeakMap || value2 instanceof Map) {
    const entry = map_get(value2, name);
    return new Ok(entry.isOk() ? new Some(entry[0]) : new None());
  } else if (value2 === null) {
    return not_a_map_error();
  } else if (Object.getPrototypeOf(value2) == Object.prototype) {
    return try_get_field(value2, name, () => new Ok(new None()));
  } else {
    return try_get_field(value2, name, not_a_map_error);
  }
}
function try_get_field(value2, field2, or_else) {
  try {
    return field2 in value2 ? new Ok(new Some(value2[field2])) : or_else();
  } catch {
    return or_else();
  }
}
function inspect$1(v) {
  const t = typeof v;
  if (v === true) return "True";
  if (v === false) return "False";
  if (v === null) return "//js(null)";
  if (v === void 0) return "Nil";
  if (t === "string") return inspectString(v);
  if (t === "bigint" || Number.isInteger(v)) return v.toString();
  if (t === "number") return float_to_string(v);
  if (Array.isArray(v)) return `#(${v.map(inspect$1).join(", ")})`;
  if (v instanceof List) return inspectList(v);
  if (v instanceof UtfCodepoint) return inspectUtfCodepoint(v);
  if (v instanceof BitArray) return inspectBitArray(v);
  if (v instanceof CustomType) return inspectCustomType(v);
  if (v instanceof Dict) return inspectDict(v);
  if (v instanceof Set) return `//js(Set(${[...v].map(inspect$1).join(", ")}))`;
  if (v instanceof RegExp) return `//js(${v})`;
  if (v instanceof Date) return `//js(Date("${v.toISOString()}"))`;
  if (v instanceof Function) {
    const args = [];
    for (const i of Array(v.length).keys())
      args.push(String.fromCharCode(i + 97));
    return `//fn(${args.join(", ")}) { ... }`;
  }
  return inspectObject(v);
}
function inspectString(str) {
  let new_str = '"';
  for (let i = 0; i < str.length; i++) {
    let char = str[i];
    switch (char) {
      case "\n":
        new_str += "\\n";
        break;
      case "\r":
        new_str += "\\r";
        break;
      case "	":
        new_str += "\\t";
        break;
      case "\f":
        new_str += "\\f";
        break;
      case "\\":
        new_str += "\\\\";
        break;
      case '"':
        new_str += '\\"';
        break;
      default:
        if (char < " " || char > "~" && char < " ") {
          new_str += "\\u{" + char.charCodeAt(0).toString(16).toUpperCase().padStart(4, "0") + "}";
        } else {
          new_str += char;
        }
    }
  }
  new_str += '"';
  return new_str;
}
function inspectDict(map2) {
  let body = "dict.from_list([";
  let first2 = true;
  map2.forEach((value2, key) => {
    if (!first2) body = body + ", ";
    body = body + "#(" + inspect$1(key) + ", " + inspect$1(value2) + ")";
    first2 = false;
  });
  return body + "])";
}
function inspectObject(v) {
  var _a, _b;
  const name = ((_b = (_a = Object.getPrototypeOf(v)) == null ? void 0 : _a.constructor) == null ? void 0 : _b.name) || "Object";
  const props = [];
  for (const k of Object.keys(v)) {
    props.push(`${inspect$1(k)}: ${inspect$1(v[k])}`);
  }
  const body = props.length ? " " + props.join(", ") + " " : "";
  const head = name === "Object" ? "" : name + " ";
  return `//js(${head}{${body}})`;
}
function inspectCustomType(record) {
  const props = Object.keys(record).map((label) => {
    const value2 = inspect$1(record[label]);
    return isNaN(parseInt(label)) ? `${label}: ${value2}` : value2;
  }).join(", ");
  return props ? `${record.constructor.name}(${props})` : record.constructor.name;
}
function inspectList(list) {
  return `[${list.toArray().map(inspect$1).join(", ")}]`;
}
function inspectBitArray(bits) {
  return `<<${Array.from(bits.buffer).join(", ")}>>`;
}
function inspectUtfCodepoint(codepoint) {
  return `//utfcodepoint(${String.fromCodePoint(codepoint.value)})`;
}
function to_string$3(x) {
  return float_to_string(x);
}
function to_string$2(x) {
  return to_string$4(x);
}
function to_float(x) {
  return identity(x);
}
function new$$1() {
  return new_map();
}
function get$1(from2, get2) {
  return map_get(from2, get2);
}
function insert(dict, key, value2) {
  return map_insert(key, value2, dict);
}
function reverse_and_concat(loop$remaining, loop$accumulator) {
  while (true) {
    let remaining = loop$remaining;
    let accumulator = loop$accumulator;
    if (remaining.hasLength(0)) {
      return accumulator;
    } else {
      let item = remaining.head;
      let rest = remaining.tail;
      loop$remaining = rest;
      loop$accumulator = prepend$1(item, accumulator);
    }
  }
}
function do_values_loop(loop$list, loop$acc) {
  while (true) {
    let list = loop$list;
    let acc = loop$acc;
    if (list.hasLength(0)) {
      return reverse_and_concat(acc, toList([]));
    } else {
      let first2 = list.head;
      let rest = list.tail;
      loop$list = rest;
      loop$acc = prepend$1(first2[1], acc);
    }
  }
}
function do_values(dict) {
  let list_of_pairs = map_to_list(dict);
  return do_values_loop(list_of_pairs, toList([]));
}
function values(dict) {
  return do_values(dict);
}
function first(pair) {
  let a = pair[0];
  return a;
}
function second(pair) {
  let a = pair[1];
  return a;
}
function map_first(pair, fun) {
  let a = pair[0];
  let b = pair[1];
  return [fun(a), b];
}
function map_second(pair, fun) {
  let a = pair[0];
  let b = pair[1];
  return [a, fun(b)];
}
function new$(first2, second2) {
  return [first2, second2];
}
function reverse_loop(loop$remaining, loop$accumulator) {
  while (true) {
    let remaining = loop$remaining;
    let accumulator = loop$accumulator;
    if (remaining.hasLength(0)) {
      return accumulator;
    } else {
      let item = remaining.head;
      let rest$1 = remaining.tail;
      loop$remaining = rest$1;
      loop$accumulator = prepend$1(item, accumulator);
    }
  }
}
function reverse(list) {
  return reverse_loop(list, toList([]));
}
function is_empty(list) {
  return isEqual(list, toList([]));
}
function filter_loop(loop$list, loop$fun, loop$acc) {
  while (true) {
    let list = loop$list;
    let fun = loop$fun;
    let acc = loop$acc;
    if (list.hasLength(0)) {
      return reverse(acc);
    } else {
      let first$1 = list.head;
      let rest$1 = list.tail;
      let new_acc = (() => {
        let $ = fun(first$1);
        if ($) {
          return prepend$1(first$1, acc);
        } else {
          return acc;
        }
      })();
      loop$list = rest$1;
      loop$fun = fun;
      loop$acc = new_acc;
    }
  }
}
function filter(list, predicate) {
  return filter_loop(list, predicate, toList([]));
}
function map_loop(loop$list, loop$fun, loop$acc) {
  while (true) {
    let list = loop$list;
    let fun = loop$fun;
    let acc = loop$acc;
    if (list.hasLength(0)) {
      return reverse(acc);
    } else {
      let first$1 = list.head;
      let rest$1 = list.tail;
      loop$list = rest$1;
      loop$fun = fun;
      loop$acc = prepend$1(fun(first$1), acc);
    }
  }
}
function map$1(list, fun) {
  return map_loop(list, fun, toList([]));
}
function append_loop(loop$first, loop$second) {
  while (true) {
    let first2 = loop$first;
    let second2 = loop$second;
    if (first2.hasLength(0)) {
      return second2;
    } else {
      let item = first2.head;
      let rest$1 = first2.tail;
      loop$first = rest$1;
      loop$second = prepend$1(item, second2);
    }
  }
}
function append$2(first2, second2) {
  return append_loop(reverse(first2), second2);
}
function prepend(list, item) {
  return prepend$1(item, list);
}
function reverse_and_prepend(loop$prefix, loop$suffix) {
  while (true) {
    let prefix = loop$prefix;
    let suffix = loop$suffix;
    if (prefix.hasLength(0)) {
      return suffix;
    } else {
      let first$1 = prefix.head;
      let rest$1 = prefix.tail;
      loop$prefix = rest$1;
      loop$suffix = prepend$1(first$1, suffix);
    }
  }
}
function concat_loop(loop$lists, loop$acc) {
  while (true) {
    let lists = loop$lists;
    let acc = loop$acc;
    if (lists.hasLength(0)) {
      return reverse(acc);
    } else {
      let list = lists.head;
      let further_lists = lists.tail;
      loop$lists = further_lists;
      loop$acc = reverse_and_prepend(list, acc);
    }
  }
}
function flatten(lists) {
  return concat_loop(lists, toList([]));
}
function flat_map(list, fun) {
  let _pipe = map$1(list, fun);
  return flatten(_pipe);
}
function fold(loop$list, loop$initial, loop$fun) {
  while (true) {
    let list = loop$list;
    let initial = loop$initial;
    let fun = loop$fun;
    if (list.hasLength(0)) {
      return initial;
    } else {
      let x = list.head;
      let rest$1 = list.tail;
      loop$list = rest$1;
      loop$initial = fun(initial, x);
      loop$fun = fun;
    }
  }
}
function append_tree(tree, suffix) {
  return add(tree, suffix);
}
function from_strings(strings) {
  return concat(strings);
}
function from_string(string2) {
  return identity(string2);
}
function append$1(tree, second2) {
  return append_tree(tree, from_string(second2));
}
function to_string$1(tree) {
  return identity(tree);
}
function append(first2, second2) {
  let _pipe = first2;
  let _pipe$1 = from_string(_pipe);
  let _pipe$2 = append$1(_pipe$1, second2);
  return to_string$1(_pipe$2);
}
function repeat_loop(loop$string, loop$times, loop$acc) {
  while (true) {
    let string2 = loop$string;
    let times = loop$times;
    let acc = loop$acc;
    let $ = times <= 0;
    if ($) {
      return acc;
    } else {
      loop$string = string2;
      loop$times = times - 1;
      loop$acc = acc + string2;
    }
  }
}
function repeat(string2, times) {
  return repeat_loop(string2, times, "");
}
function join(strings, separator) {
  return join$1(strings, separator);
}
function inspect(term) {
  let _pipe = inspect$1(term);
  return to_string$1(_pipe);
}
function map(result, fun) {
  if (result.isOk()) {
    let x = result[0];
    return new Ok(fun(x));
  } else {
    let e = result[0];
    return new Error2(e);
  }
}
function map_error(result, fun) {
  if (result.isOk()) {
    let x = result[0];
    return new Ok(x);
  } else {
    let error = result[0];
    return new Error2(fun(error));
  }
}
function try$(result, fun) {
  if (result.isOk()) {
    let x = result[0];
    return fun(x);
  } else {
    let e = result[0];
    return new Error2(e);
  }
}
function lazy_unwrap(result, default$) {
  if (result.isOk()) {
    let v = result[0];
    return v;
  } else {
    return default$();
  }
}
class DecodeError extends CustomType {
  constructor(expected, found, path) {
    super();
    this.expected = expected;
    this.found = found;
    this.path = path;
  }
}
function classify(data) {
  return classify_dynamic(data);
}
function int(data) {
  return decode_int(data);
}
function any(decoders) {
  return (data) => {
    if (decoders.hasLength(0)) {
      return new Error2(
        toList([new DecodeError("another type", classify(data), toList([]))])
      );
    } else {
      let decoder = decoders.head;
      let decoders$1 = decoders.tail;
      let $ = decoder(data);
      if ($.isOk()) {
        let decoded = $[0];
        return new Ok(decoded);
      } else {
        return any(decoders$1)(data);
      }
    }
  };
}
function push_path(error, name) {
  let name$1 = identity(name);
  let decoder = any(
    toList([string, (x) => {
      return map(int(x), to_string$2);
    }])
  );
  let name$2 = (() => {
    let $ = decoder(name$1);
    if ($.isOk()) {
      let name$22 = $[0];
      return name$22;
    } else {
      let _pipe = toList(["<", classify(name$1), ">"]);
      let _pipe$1 = from_strings(_pipe);
      return to_string$1(_pipe$1);
    }
  })();
  return error.withFields({ path: prepend$1(name$2, error.path) });
}
function map_errors(result, f) {
  return map_error(
    result,
    (_capture) => {
      return map$1(_capture, f);
    }
  );
}
function string(data) {
  return decode_string(data);
}
function field(name, inner_type) {
  return (value2) => {
    let missing_field_error = new DecodeError("field", "nothing", toList([]));
    return try$(
      decode_field(value2, name),
      (maybe_inner) => {
        let _pipe = maybe_inner;
        let _pipe$1 = to_result(_pipe, toList([missing_field_error]));
        let _pipe$2 = try$(_pipe$1, inner_type);
        return map_errors(
          _pipe$2,
          (_capture) => {
            return push_path(_capture, name);
          }
        );
      }
    );
  };
}
function guard(requirement, consequence, alternative) {
  if (requirement) {
    return consequence;
  } else {
    return alternative();
  }
}
class Effect extends CustomType {
  constructor(all) {
    super();
    this.all = all;
  }
}
function custom(run) {
  return new Effect(
    toList([
      (actions) => {
        return run(actions.dispatch, actions.emit, actions.select, actions.root);
      }
    ])
  );
}
function from(effect) {
  return custom((dispatch, _, _1, _2) => {
    return effect(dispatch);
  });
}
function none$1() {
  return new Effect(toList([]));
}
let Text$1 = class Text extends CustomType {
  constructor(content) {
    super();
    this.content = content;
  }
};
let Element$1 = class Element extends CustomType {
  constructor(key, namespace, tag, attrs, children2, self_closing, void$) {
    super();
    this.key = key;
    this.namespace = namespace;
    this.tag = tag;
    this.attrs = attrs;
    this.children = children2;
    this.self_closing = self_closing;
    this.void = void$;
  }
};
class Attribute extends CustomType {
  constructor(x0, x1, as_property) {
    super();
    this[0] = x0;
    this[1] = x1;
    this.as_property = as_property;
  }
}
class Event extends CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}
function attribute(name, value2) {
  return new Attribute(name, identity(value2), false);
}
function on$1(name, handler) {
  return new Event("on" + name, handler);
}
function style(properties) {
  return attribute(
    "style",
    fold(
      properties,
      "",
      (styles, _use1) => {
        let name$1 = _use1[0];
        let value$12 = _use1[1];
        return styles + name$1 + ":" + value$12 + ";";
      }
    )
  );
}
function class$$2(name) {
  return attribute("class", name);
}
function type_(name) {
  return attribute("type", name);
}
function value$1(val) {
  return attribute("value", val);
}
function element$1(tag, attrs, children2) {
  if (tag === "area") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "base") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "br") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "col") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "embed") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "hr") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "img") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "input") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "link") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "meta") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "param") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "source") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "track") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else if (tag === "wbr") {
    return new Element$1("", "", tag, attrs, toList([]), false, true);
  } else {
    return new Element$1("", "", tag, attrs, children2, false, false);
  }
}
function text$2(content) {
  return new Text$1(content);
}
function none() {
  return new Text$1("");
}
function fragment$1(elements) {
  return element$1(
    "lustre-fragment",
    toList([style(toList([["display", "contents"]]))]),
    elements
  );
}
class Debug extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Dispatch extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Emit extends CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}
class Shutdown extends CustomType {
}
class ForceModel extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
if (window && window.customElements) {
  window.customElements.define(
    "lustre-fragment",
    class LustreFragment extends HTMLElement {
      constructor() {
        super();
      }
    }
  );
}
function morph(prev, next, dispatch) {
  let out;
  let stack = [{ prev, next, parent: prev.parentNode }];
  while (stack.length) {
    let { prev: prev2, next: next2, parent } = stack.pop();
    while (next2.subtree !== void 0) next2 = next2.subtree();
    if (next2.content !== void 0) {
      if (!prev2) {
        const created = document.createTextNode(next2.content);
        parent.appendChild(created);
        out ?? (out = created);
      } else if (prev2.nodeType === Node.TEXT_NODE) {
        if (prev2.textContent !== next2.content) prev2.textContent = next2.content;
        out ?? (out = prev2);
      } else {
        const created = document.createTextNode(next2.content);
        parent.replaceChild(created, prev2);
        out ?? (out = created);
      }
    } else if (next2.tag !== void 0) {
      const created = createElementNode({
        prev: prev2,
        next: next2,
        dispatch,
        stack
      });
      if (!prev2) {
        parent.appendChild(created);
      } else if (prev2 !== created) {
        parent.replaceChild(created, prev2);
      }
      out ?? (out = created);
    }
  }
  return out;
}
function createElementNode({ prev, next, dispatch, stack }) {
  var _a;
  const namespace = next.namespace || "http://www.w3.org/1999/xhtml";
  const canMorph = prev && prev.nodeType === Node.ELEMENT_NODE && prev.localName === next.tag && prev.namespaceURI === (next.namespace || "http://www.w3.org/1999/xhtml");
  const el = canMorph ? prev : namespace ? document.createElementNS(namespace, next.tag) : document.createElement(next.tag);
  let handlersForEl;
  if (!registeredHandlers.has(el)) {
    const emptyHandlers = /* @__PURE__ */ new Map();
    registeredHandlers.set(el, emptyHandlers);
    handlersForEl = emptyHandlers;
  } else {
    handlersForEl = registeredHandlers.get(el);
  }
  const prevHandlers = canMorph ? new Set(handlersForEl.keys()) : null;
  const prevAttributes = canMorph ? new Set(Array.from(prev.attributes, (a) => a.name)) : null;
  let className = null;
  let style2 = null;
  let innerHTML = null;
  if (canMorph && next.tag === "textarea") {
    const innertText = (_a = next.children[Symbol.iterator]().next().value) == null ? void 0 : _a.content;
    if (innertText !== void 0) el.value = innertText;
  }
  const delegated = [];
  for (const attr of next.attrs) {
    const name = attr[0];
    const value2 = attr[1];
    if (attr.as_property) {
      if (el[name] !== value2) el[name] = value2;
      if (canMorph) prevAttributes.delete(name);
    } else if (name.startsWith("on")) {
      const eventName = name.slice(2);
      const callback = dispatch(value2, eventName === "input");
      if (!handlersForEl.has(eventName)) {
        el.addEventListener(eventName, lustreGenericEventHandler);
      }
      handlersForEl.set(eventName, callback);
      if (canMorph) prevHandlers.delete(eventName);
    } else if (name.startsWith("data-lustre-on-")) {
      const eventName = name.slice(15);
      const callback = dispatch(lustreServerEventHandler);
      if (!handlersForEl.has(eventName)) {
        el.addEventListener(eventName, lustreGenericEventHandler);
      }
      handlersForEl.set(eventName, callback);
      el.setAttribute(name, value2);
    } else if (name.startsWith("delegate:data-") || name.startsWith("delegate:aria-")) {
      el.setAttribute(name, value2);
      delegated.push([name.slice(10), value2]);
    } else if (name === "class") {
      className = className === null ? value2 : className + " " + value2;
    } else if (name === "style") {
      style2 = style2 === null ? value2 : style2 + value2;
    } else if (name === "dangerous-unescaped-html") {
      innerHTML = value2;
    } else {
      if (el.getAttribute(name) !== value2) el.setAttribute(name, value2);
      if (name === "value" || name === "selected") el[name] = value2;
      if (canMorph) prevAttributes.delete(name);
    }
  }
  if (className !== null) {
    el.setAttribute("class", className);
    if (canMorph) prevAttributes.delete("class");
  }
  if (style2 !== null) {
    el.setAttribute("style", style2);
    if (canMorph) prevAttributes.delete("style");
  }
  if (canMorph) {
    for (const attr of prevAttributes) {
      el.removeAttribute(attr);
    }
    for (const eventName of prevHandlers) {
      handlersForEl.delete(eventName);
      el.removeEventListener(eventName, lustreGenericEventHandler);
    }
  }
  if (next.tag === "slot") {
    window.queueMicrotask(() => {
      for (const child of el.assignedElements()) {
        for (const [name, value2] of delegated) {
          if (!child.hasAttribute(name)) {
            child.setAttribute(name, value2);
          }
        }
      }
    });
  }
  if (next.key !== void 0 && next.key !== "") {
    el.setAttribute("data-lustre-key", next.key);
  } else if (innerHTML !== null) {
    el.innerHTML = innerHTML;
    return el;
  }
  let prevChild = el.firstChild;
  let seenKeys = null;
  let keyedChildren = null;
  let incomingKeyedChildren = null;
  let firstChild = children(next).next().value;
  if (canMorph && firstChild !== void 0 && // Explicit checks are more verbose but truthy checks force a bunch of comparisons
  // we don't care about: it's never gonna be a number etc.
  firstChild.key !== void 0 && firstChild.key !== "") {
    seenKeys = /* @__PURE__ */ new Set();
    keyedChildren = getKeyedChildren(prev);
    incomingKeyedChildren = getKeyedChildren(next);
    for (const child of children(next)) {
      prevChild = diffKeyedChild(
        prevChild,
        child,
        el,
        stack,
        incomingKeyedChildren,
        keyedChildren,
        seenKeys
      );
    }
  } else {
    for (const child of children(next)) {
      stack.unshift({ prev: prevChild, next: child, parent: el });
      prevChild = prevChild == null ? void 0 : prevChild.nextSibling;
    }
  }
  while (prevChild) {
    const next2 = prevChild.nextSibling;
    el.removeChild(prevChild);
    prevChild = next2;
  }
  return el;
}
const registeredHandlers = /* @__PURE__ */ new WeakMap();
function lustreGenericEventHandler(event) {
  const target = event.currentTarget;
  if (!registeredHandlers.has(target)) {
    target.removeEventListener(event.type, lustreGenericEventHandler);
    return;
  }
  const handlersForEventTarget = registeredHandlers.get(target);
  if (!handlersForEventTarget.has(event.type)) {
    target.removeEventListener(event.type, lustreGenericEventHandler);
    return;
  }
  handlersForEventTarget.get(event.type)(event);
}
function lustreServerEventHandler(event) {
  const el = event.currentTarget;
  const tag = el.getAttribute(`data-lustre-on-${event.type}`);
  const data = JSON.parse(el.getAttribute("data-lustre-data") || "{}");
  const include = JSON.parse(el.getAttribute("data-lustre-include") || "[]");
  switch (event.type) {
    case "input":
    case "change":
      include.push("target.value");
      break;
  }
  return {
    tag,
    data: include.reduce(
      (data2, property2) => {
        var _a;
        const path = property2.split(".");
        for (let i = 0, o = data2, e = event; i < path.length; i++) {
          if (i === path.length - 1) {
            o[path[i]] = e[path[i]];
          } else {
            o[_a = path[i]] ?? (o[_a] = {});
            e = e[path[i]];
            o = o[path[i]];
          }
        }
        return data2;
      },
      { data }
    )
  };
}
function getKeyedChildren(el) {
  var _a;
  const keyedChildren = /* @__PURE__ */ new Map();
  if (el) {
    for (const child of children(el)) {
      const key = (child == null ? void 0 : child.key) || ((_a = child == null ? void 0 : child.getAttribute) == null ? void 0 : _a.call(child, "data-lustre-key"));
      if (key) keyedChildren.set(key, child);
    }
  }
  return keyedChildren;
}
function diffKeyedChild(prevChild, child, el, stack, incomingKeyedChildren, keyedChildren, seenKeys) {
  while (prevChild && !incomingKeyedChildren.has(prevChild.getAttribute("data-lustre-key"))) {
    const nextChild = prevChild.nextSibling;
    el.removeChild(prevChild);
    prevChild = nextChild;
  }
  if (keyedChildren.size === 0) {
    stack.unshift({ prev: prevChild, next: child, parent: el });
    prevChild = prevChild == null ? void 0 : prevChild.nextSibling;
    return prevChild;
  }
  if (seenKeys.has(child.key)) {
    console.warn(`Duplicate key found in Lustre vnode: ${child.key}`);
    stack.unshift({ prev: null, next: child, parent: el });
    return prevChild;
  }
  seenKeys.add(child.key);
  const keyedChild = keyedChildren.get(child.key);
  if (!keyedChild && !prevChild) {
    stack.unshift({ prev: null, next: child, parent: el });
    return prevChild;
  }
  if (!keyedChild && prevChild !== null) {
    const placeholder = document.createTextNode("");
    el.insertBefore(placeholder, prevChild);
    stack.unshift({ prev: placeholder, next: child, parent: el });
    return prevChild;
  }
  if (!keyedChild || keyedChild === prevChild) {
    stack.unshift({ prev: prevChild, next: child, parent: el });
    prevChild = prevChild == null ? void 0 : prevChild.nextSibling;
    return prevChild;
  }
  el.insertBefore(keyedChild, prevChild);
  stack.unshift({ prev: keyedChild, next: child, parent: el });
  return prevChild;
}
function* children(element2) {
  for (const child of element2.children) {
    yield* forceChild(child);
  }
}
function* forceChild(element2) {
  if (element2.subtree !== void 0) {
    yield* forceChild(element2.subtree());
  } else {
    yield element2;
  }
}
const _LustreClientApplication = class _LustreClientApplication {
  /**
   * @param {Element} root
   * @param {[Model, Lustre.Effect<Msg>]} init
   * @param {(model: Model, msg: Msg) => [Model, Lustre.Effect<Msg>]} update
   * @param {(model: Model) => Lustre.Element<Msg>} view
   *
   * @returns {LustreClientApplication}
   */
  constructor(root, [init2, effects], update2, view2) {
    __privateAdd(this, _LustreClientApplication_instances);
    /** @type {Element} */
    __publicField(this, "root");
    /** @type {Model} */
    __privateAdd(this, _model);
    /** @type {(model: Model, msg: Msg) => [Model, Lustre.Effect<Msg>]} */
    __privateAdd(this, _update);
    /** @type {(model: Model) => Lustre.Element<Msg>} */
    __privateAdd(this, _view);
    /** @type {Array<Msg>} */
    __privateAdd(this, _queue, []);
    /** @type {number | undefined} */
    __privateAdd(this, _tickScheduled);
    this.root = root;
    __privateSet(this, _model, init2);
    __privateSet(this, _update, update2);
    __privateSet(this, _view, view2);
    __privateSet(this, _tickScheduled, window.requestAnimationFrame(
      () => __privateMethod(this, _LustreClientApplication_instances, tick_fn).call(this, effects.all.toArray(), true)
    ));
  }
  /**
   * @template Flags
   *
   * @param {object} app
   * @param {(flags: Flags) => [Model, Lustre.Effect<Msg>]} app.init
   * @param {(msg: Msg, model: Model) => [Model, Lustre.Effect<Msg>]} app.update
   * @param {(model: Model) => Lustre.Element<Msg>} app.view
   * @param {string | HTMLElement} selector
   * @param {Flags} flags
   *
   * @returns {Gleam.Ok<(action: Lustre.Action<Lustre.Client, Msg>>) => void>}
   */
  static start({ init: init2, update: update2, view: view2 }, selector, flags) {
    if (!is_browser()) return new Error2(new NotABrowser());
    const root = selector instanceof HTMLElement ? selector : document.querySelector(selector);
    if (!root) return new Error2(new ElementNotFound(selector));
    const app = new _LustreClientApplication(root, init2(flags), update2, view2);
    return new Ok((action) => app.send(action));
  }
  /**
   * @param {Lustre.Action<Lustre.Client, Msg>} action
   *
   * @returns {void}
   */
  send(action) {
    if (action instanceof Debug) {
      if (action[0] instanceof ForceModel) {
        __privateSet(this, _tickScheduled, window.cancelAnimationFrame(__privateGet(this, _tickScheduled)));
        __privateSet(this, _queue, []);
        __privateSet(this, _model, action[0][0]);
        const vdom = __privateGet(this, _view).call(this, __privateGet(this, _model));
        const dispatch = (handler, immediate = false) => (event) => {
          const result = handler(event);
          if (result instanceof Ok) {
            this.send(new Dispatch(result[0], immediate));
          }
        };
        const prev = this.root.firstChild ?? this.root.appendChild(document.createTextNode(""));
        morph(prev, vdom, dispatch);
      }
    } else if (action instanceof Dispatch) {
      const msg = action[0];
      const immediate = action[1] ?? false;
      __privateGet(this, _queue).push(msg);
      if (immediate) {
        __privateSet(this, _tickScheduled, window.cancelAnimationFrame(__privateGet(this, _tickScheduled)));
        __privateMethod(this, _LustreClientApplication_instances, tick_fn).call(this);
      } else if (!__privateGet(this, _tickScheduled)) {
        __privateSet(this, _tickScheduled, window.requestAnimationFrame(() => __privateMethod(this, _LustreClientApplication_instances, tick_fn).call(this)));
      }
    } else if (action instanceof Emit) {
      const event = action[0];
      const data = action[1];
      this.root.dispatchEvent(
        new CustomEvent(event, {
          detail: data,
          bubbles: true,
          composed: true
        })
      );
    } else if (action instanceof Shutdown) {
      __privateSet(this, _tickScheduled, window.cancelAnimationFrame(__privateGet(this, _tickScheduled)));
      __privateSet(this, _model, null);
      __privateSet(this, _update, null);
      __privateSet(this, _view, null);
      __privateSet(this, _queue, null);
      while (this.root.firstChild) {
        this.root.firstChild.remove();
      }
    }
  }
};
_model = new WeakMap();
_update = new WeakMap();
_view = new WeakMap();
_queue = new WeakMap();
_tickScheduled = new WeakMap();
_LustreClientApplication_instances = new WeakSet();
/**
 * @param {Lustre.Effect<Msg>[]} effects
 * @param {boolean} isFirstRender
 */
tick_fn = function(effects = [], isFirstRender = false) {
  __privateSet(this, _tickScheduled, void 0);
  if (!__privateMethod(this, _LustreClientApplication_instances, flush_fn).call(this, effects, isFirstRender)) return;
  const vdom = __privateGet(this, _view).call(this, __privateGet(this, _model));
  const dispatch = (handler, immediate = false) => (event) => {
    const result = handler(event);
    if (result instanceof Ok) {
      this.send(new Dispatch(result[0], immediate));
    }
  };
  const prev = this.root.firstChild ?? this.root.appendChild(document.createTextNode(""));
  morph(prev, vdom, dispatch);
};
flush_fn = function(effects = [], didUpdate = false) {
  while (__privateGet(this, _queue).length > 0) {
    const msg = __privateGet(this, _queue).shift();
    const [next, effect] = __privateGet(this, _update).call(this, __privateGet(this, _model), msg);
    didUpdate || (didUpdate = __privateGet(this, _model) !== next);
    effects = effects.concat(effect.all.toArray());
    __privateSet(this, _model, next);
  }
  while (effects.length > 0) {
    const effect = effects.shift();
    const dispatch = (msg) => this.send(new Dispatch(msg));
    const emit = (event, data) => this.root.dispatchEvent(
      new CustomEvent(event, {
        detail: data,
        bubbles: true,
        composed: true
      })
    );
    const select = () => {
    };
    const root = this.root;
    effect({ dispatch, emit, select, root });
  }
  if (__privateGet(this, _queue).length > 0) {
    return __privateMethod(this, _LustreClientApplication_instances, flush_fn).call(this, effects, didUpdate);
  } else {
    return didUpdate;
  }
};
let LustreClientApplication = _LustreClientApplication;
const start$1 = LustreClientApplication.start;
const is_browser = () => globalThis.window && window.document;
class App extends CustomType {
  constructor(init2, update2, view2, on_attribute_change) {
    super();
    this.init = init2;
    this.update = update2;
    this.view = view2;
    this.on_attribute_change = on_attribute_change;
  }
}
class ElementNotFound extends CustomType {
  constructor(selector) {
    super();
    this.selector = selector;
  }
}
class NotABrowser extends CustomType {
}
function application(init2, update2, view2) {
  return new App(init2, update2, view2, new None());
}
function start(app, selector, flags) {
  return guard(
    !is_browser(),
    new Error2(new NotABrowser()),
    () => {
      return start$1(app, selector, flags);
    }
  );
}
function on(name, handler) {
  return on$1(name, handler);
}
function on_click(msg) {
  return on("click", (_) => {
    return new Ok(msg);
  });
}
function value(event) {
  let _pipe = event;
  return field("target", field("value", string))(
    _pipe
  );
}
function on_input(msg) {
  return on(
    "input",
    (event) => {
      let _pipe = value(event);
      return map(_pipe, msg);
    }
  );
}
class Definitions extends CustomType {
  constructor(medias_def, selectors_def, class_def) {
    super();
    this.medias_def = medias_def;
    this.selectors_def = selectors_def;
    this.class_def = class_def;
  }
}
class Content extends CustomType {
  constructor(class_name2, class_id, definitions2, rules) {
    super();
    this.class_name = class_name2;
    this.class_id = class_id;
    this.definitions = definitions2;
    this.rules = rules;
  }
}
function class_name$2(class$2) {
  return class$2.class_name;
}
function definitions(class$2) {
  let $ = class$2.definitions;
  let medias = $.medias_def;
  let selectors = $.selectors_def;
  let class$1 = $.class_def;
  let _pipe = toList([toList([class$1]), selectors, medias]);
  return flatten(_pipe);
}
function create(class_name2, class_id, rules, definitions2) {
  return new Content(class_name2, class_id, definitions2, rules);
}
function indent(indent2) {
  return repeat(" ", indent2);
}
function wrap_class(id, properties, idt, pseudo) {
  let base_indent = indent(idt);
  let pseudo_ = unwrap(pseudo, "");
  let _pipe = prepend$1(
    base_indent + "." + id + pseudo_ + " {",
    properties
  );
  let _pipe$1 = join(_pipe, "\n");
  return append(_pipe$1, "\n" + base_indent + "}");
}
const wasmBytes = "AGFzbQEAAAABMAhgA39/fwF/YAN/f38AYAJ/fwBgAX8Bf2ADf39+AX5gA35/fwF+YAJ/fgBgAX8BfgMLCgAAAgEDBAUGAQcFAwEAAQdVCQNtZW0CAAV4eGgzMgAABmluaXQzMgACCHVwZGF0ZTMyAAMIZGlnZXN0MzIABAV4eGg2NAAFBmluaXQ2NAAHCHVwZGF0ZTY0AAgIZGlnZXN0NjQACQr7FgryAQEEfyAAIAFqIQMgAUEQTwR/IANBEGshBiACQaiIjaECaiEDIAJBievQ0AdrIQQgAkHPjKKOBmohBQNAIAMgACgCAEH3lK+veGxqQQ13QbHz3fF5bCEDIAQgAEEEaiIAKAIAQfeUr694bGpBDXdBsfPd8XlsIQQgAiAAQQRqIgAoAgBB95Svr3hsakENd0Gx893xeWwhAiAFIABBBGoiACgCAEH3lK+veGxqQQ13QbHz3fF5bCEFIAYgAEEEaiIATw0ACyACQQx3IAVBEndqIARBB3dqIANBAXdqBSACQbHP2bIBagsgAWogACABQQ9xEAELkgEAIAEgAmohAgNAIAFBBGogAktFBEAgACABKAIAQb3cypV8bGpBEXdBr9bTvgJsIQAgAUEEaiEBDAELCwNAIAEgAk9FBEAgACABLQAAQbHP2bIBbGpBC3dBsfPd8XlsIQAgAUEBaiEBDAELCyAAIABBD3ZzQfeUr694bCIAQQ12IABzQb3cypV8bCIAQRB2IABzCz8AIABBCGogAUGoiI2hAmo2AgAgAEEMaiABQYnr0NAHazYCACAAQRBqIAE2AgAgAEEUaiABQc+Moo4GajYCAAvDBAEGfyABIAJqIQYgAEEYaiEEIABBKGooAgAhAyAAIAAoAgAgAmo2AgAgAEEEaiIFIAUoAgAgAkEQTyAAKAIAQRBPcnI2AgAgAiADakEQSQRAIAMgBGogASAC/AoAACAAQShqIAIgA2o2AgAPCyADBEAgAyAEaiABQRAgA2siAvwKAAAgAEEIaiIDIAMoAgAgBCgCAEH3lK+veGxqQQ13QbHz3fF5bDYCACAAQQxqIgMgAygCACAEQQRqKAIAQfeUr694bGpBDXdBsfPd8XlsNgIAIABBEGoiAyADKAIAIARBCGooAgBB95Svr3hsakENd0Gx893xeWw2AgAgAEEUaiIDIAMoAgAgBEEMaigCAEH3lK+veGxqQQ13QbHz3fF5bDYCACAAQShqQQA2AgAgASACaiEBCyABIAZBEGtNBEAgBkEQayEIIABBCGooAgAhAiAAQQxqKAIAIQMgAEEQaigCACEFIABBFGooAgAhBwNAIAIgASgCAEH3lK+veGxqQQ13QbHz3fF5bCECIAMgAUEEaiIBKAIAQfeUr694bGpBDXdBsfPd8XlsIQMgBSABQQRqIgEoAgBB95Svr3hsakENd0Gx893xeWwhBSAHIAFBBGoiASgCAEH3lK+veGxqQQ13QbHz3fF5bCEHIAggAUEEaiIBTw0ACyAAQQhqIAI2AgAgAEEMaiADNgIAIABBEGogBTYCACAAQRRqIAc2AgALIAEgBkkEQCAEIAEgBiABayIB/AoAACAAQShqIAE2AgALC2EBAX8gAEEQaigCACEBIABBBGooAgAEfyABQQx3IABBFGooAgBBEndqIABBDGooAgBBB3dqIABBCGooAgBBAXdqBSABQbHP2bIBagsgACgCAGogAEEYaiAAQShqKAIAEAEL/wMCA34BfyAAIAFqIQYgAUEgTwR+IAZBIGshBiACQtbrgu7q/Yn14AB8IQMgAkKxqazBrbjUpj19IQQgAkL56tDQ58mh5OEAfCEFA0AgAyAAKQMAQs/W077Sx6vZQn58Qh+JQoeVr6+Ytt6bnn9+IQMgBCAAQQhqIgApAwBCz9bTvtLHq9lCfnxCH4lCh5Wvr5i23puef34hBCACIABBCGoiACkDAELP1tO+0ser2UJ+fEIfiUKHla+vmLbem55/fiECIAUgAEEIaiIAKQMAQs/W077Sx6vZQn58Qh+JQoeVr6+Ytt6bnn9+IQUgBiAAQQhqIgBPDQALIAJCDIkgBUISiXwgBEIHiXwgA0IBiXwgA0LP1tO+0ser2UJ+Qh+JQoeVr6+Ytt6bnn9+hUKHla+vmLbem55/fkKdo7Xqg7GNivoAfSAEQs/W077Sx6vZQn5CH4lCh5Wvr5i23puef36FQoeVr6+Ytt6bnn9+Qp2jteqDsY2K+gB9IAJCz9bTvtLHq9lCfkIfiUKHla+vmLbem55/foVCh5Wvr5i23puef35CnaO16oOxjYr6AH0gBULP1tO+0ser2UJ+Qh+JQoeVr6+Ytt6bnn9+hUKHla+vmLbem55/fkKdo7Xqg7GNivoAfQUgAkLFz9my8eW66id8CyABrXwgACABQR9xEAYLhgIAIAEgAmohAgNAIAIgAUEIak8EQCABKQMAQs/W077Sx6vZQn5CH4lCh5Wvr5i23puef34gAIVCG4lCh5Wvr5i23puef35CnaO16oOxjYr6AH0hACABQQhqIQEMAQsLIAFBBGogAk0EQCAAIAE1AgBCh5Wvr5i23puef36FQheJQs/W077Sx6vZQn5C+fPd8Zn2masWfCEAIAFBBGohAQsDQCABIAJJBEAgACABMQAAQsXP2bLx5brqJ36FQguJQoeVr6+Ytt6bnn9+IQAgAUEBaiEBDAELCyAAIABCIYiFQs/W077Sx6vZQn4iACAAQh2IhUL5893xmfaZqxZ+IgAgAEIgiIULTQAgAEEIaiABQtbrgu7q/Yn14AB8NwMAIABBEGogAUKxqazBrbjUpj19NwMAIABBGGogATcDACAAQSBqIAFC+erQ0OfJoeThAHw3AwAL9AQCA38EfiABIAJqIQUgAEEoaiEEIABByABqKAIAIQMgACAAKQMAIAKtfDcDACACIANqQSBJBEAgAyAEaiABIAL8CgAAIABByABqIAIgA2o2AgAPCyADBEAgAyAEaiABQSAgA2siAvwKAAAgAEEIaiIDIAMpAwAgBCkDAELP1tO+0ser2UJ+fEIfiUKHla+vmLbem55/fjcDACAAQRBqIgMgAykDACAEQQhqKQMAQs/W077Sx6vZQn58Qh+JQoeVr6+Ytt6bnn9+NwMAIABBGGoiAyADKQMAIARBEGopAwBCz9bTvtLHq9lCfnxCH4lCh5Wvr5i23puef343AwAgAEEgaiIDIAMpAwAgBEEYaikDAELP1tO+0ser2UJ+fEIfiUKHla+vmLbem55/fjcDACAAQcgAakEANgIAIAEgAmohAQsgAUEgaiAFTQRAIAVBIGshAiAAQQhqKQMAIQYgAEEQaikDACEHIABBGGopAwAhCCAAQSBqKQMAIQkDQCAGIAEpAwBCz9bTvtLHq9lCfnxCH4lCh5Wvr5i23puef34hBiAHIAFBCGoiASkDAELP1tO+0ser2UJ+fEIfiUKHla+vmLbem55/fiEHIAggAUEIaiIBKQMAQs/W077Sx6vZQn58Qh+JQoeVr6+Ytt6bnn9+IQggCSABQQhqIgEpAwBCz9bTvtLHq9lCfnxCH4lCh5Wvr5i23puef34hCSACIAFBCGoiAU8NAAsgAEEIaiAGNwMAIABBEGogBzcDACAAQRhqIAg3AwAgAEEgaiAJNwMACyABIAVJBEAgBCABIAUgAWsiAfwKAAAgAEHIAGogATYCAAsLvAIBBX4gAEEYaikDACEBIAApAwAiAkIgWgR+IABBCGopAwAiA0IBiSAAQRBqKQMAIgRCB4l8IAFCDIkgAEEgaikDACIFQhKJfHwgA0LP1tO+0ser2UJ+Qh+JQoeVr6+Ytt6bnn9+hUKHla+vmLbem55/fkKdo7Xqg7GNivoAfSAEQs/W077Sx6vZQn5CH4lCh5Wvr5i23puef36FQoeVr6+Ytt6bnn9+Qp2jteqDsY2K+gB9IAFCz9bTvtLHq9lCfkIfiUKHla+vmLbem55/foVCh5Wvr5i23puef35CnaO16oOxjYr6AH0gBULP1tO+0ser2UJ+Qh+JQoeVr6+Ytt6bnn9+hUKHla+vmLbem55/fkKdo7Xqg7GNivoAfQUgAULFz9my8eW66id8CyACfCAAQShqIAJCH4OnEAYL";
const u32_BYTES = 4;
const u64_BYTES = 8;
const XXH32_STATE_SIZE_BYTES = u32_BYTES + // total_len
u32_BYTES + // large_len
u32_BYTES * 4 + // Accumulator lanes
u32_BYTES * 4 + // Internal buffer
u32_BYTES + // memsize
u32_BYTES;
const XXH64_STATE_SIZE_BYTES = u64_BYTES + // total_len
u64_BYTES * 4 + // Accumulator lanes
u64_BYTES * 4 + // Internal buffer
u32_BYTES + // memsize
u32_BYTES + // reserved32
u64_BYTES;
function xxhash() {
  const bytes = Uint8Array.from(atob(wasmBytes), (c) => c.charCodeAt(0));
  const mod = new WebAssembly.Module(bytes);
  const {
    exports: {
      mem,
      xxh32,
      xxh64,
      init32,
      update32,
      digest32,
      init64,
      update64,
      digest64
    }
  } = new WebAssembly.Instance(mod);
  let memory = new Uint8Array(mem.buffer);
  function growMemory(length, offset) {
    if (mem.buffer.byteLength < length + offset) {
      const extraPages = Math.ceil(
        // Wasm pages are spec'd to 64K
        (length + offset - mem.buffer.byteLength) / (64 * 1024)
      );
      mem.grow(extraPages);
      memory = new Uint8Array(mem.buffer);
    }
  }
  function create2(size, seed, init2, update2, digest, finalize) {
    growMemory(size);
    const state = new Uint8Array(size);
    memory.set(state);
    init2(0, seed);
    state.set(memory.slice(0, size));
    return {
      update(input2) {
        memory.set(state);
        let length;
        if (typeof input2 === "string") {
          growMemory(input2.length * 3, size);
          length = encoder.encodeInto(input2, memory.subarray(size)).written;
        } else {
          growMemory(input2.byteLength, size);
          memory.set(input2, size);
          length = input2.byteLength;
        }
        update2(0, size, length);
        state.set(memory.slice(0, size));
        return this;
      },
      digest() {
        memory.set(state);
        return finalize(digest(0));
      }
    };
  }
  function forceUnsigned32(i) {
    return i >>> 0;
  }
  const u64Max = 2n ** 64n - 1n;
  function forceUnsigned64(i) {
    return i & u64Max;
  }
  const encoder = new TextEncoder();
  const defaultSeed = 0;
  const defaultBigSeed = 0n;
  function h32(str, seed = defaultSeed) {
    growMemory(str.length * 3, 0);
    return forceUnsigned32(
      xxh32(0, encoder.encodeInto(str, memory).written, seed)
    );
  }
  function h64(str, seed = defaultBigSeed) {
    growMemory(str.length * 3, 0);
    return forceUnsigned64(
      xxh64(0, encoder.encodeInto(str, memory).written, seed)
    );
  }
  return {
    h32,
    h32ToString(str, seed = defaultSeed) {
      return h32(str, seed).toString(16).padStart(8, "0");
    },
    h32Raw(inputBuffer, seed = defaultSeed) {
      growMemory(inputBuffer.byteLength, 0);
      memory.set(inputBuffer);
      return forceUnsigned32(xxh32(0, inputBuffer.byteLength, seed));
    },
    create32(seed = defaultSeed) {
      return create2(
        XXH32_STATE_SIZE_BYTES,
        seed,
        init32,
        update32,
        digest32,
        forceUnsigned32
      );
    },
    h64,
    h64ToString(str, seed = defaultBigSeed) {
      return h64(str, seed).toString(16).padStart(16, "0");
    },
    h64Raw(inputBuffer, seed = defaultBigSeed) {
      growMemory(inputBuffer.byteLength, 0);
      memory.set(inputBuffer);
      return forceUnsigned64(xxh64(0, inputBuffer.byteLength, seed));
    },
    create64(seed = defaultBigSeed) {
      return create2(
        XXH64_STATE_SIZE_BYTES,
        seed,
        init64,
        update64,
        digest64,
        forceUnsigned64
      );
    }
  };
}
const hasher = xxhash();
function xxHash32(content) {
  return hasher.h32(content);
}
class Class extends CustomType {
  constructor(string_representation, content) {
    super();
    this.string_representation = string_representation;
    this.content = content;
  }
}
class EphemeralCache extends CustomType {
  constructor(cache2) {
    super();
    this.cache = cache2;
  }
}
class PersistentCache extends CustomType {
  constructor(cache2, current_id) {
    super();
    this.cache = cache2;
    this.current_id = current_id;
  }
}
class Media extends CustomType {
  constructor(query, styles) {
    super();
    this.query = query;
    this.styles = styles;
  }
}
class PseudoSelector extends CustomType {
  constructor(pseudo_selector2, styles) {
    super();
    this.pseudo_selector = pseudo_selector2;
    this.styles = styles;
  }
}
class Property extends CustomType {
  constructor(key, value2, important) {
    super();
    this.key = key;
    this.value = value2;
    this.important = important;
  }
}
class NoStyle extends CustomType {
}
class ComputedProperties extends CustomType {
  constructor(properties, medias, pseudo_selectors, indent2) {
    super();
    this.properties = properties;
    this.medias = medias;
    this.pseudo_selectors = pseudo_selectors;
    this.indent = indent2;
  }
}
class MediaProperty extends CustomType {
  constructor(query, properties, pseudo_selectors) {
    super();
    this.query = query;
    this.properties = properties;
    this.pseudo_selectors = pseudo_selectors;
  }
}
class PseudoProperty extends CustomType {
  constructor(pseudo_selector2, properties) {
    super();
    this.pseudo_selector = pseudo_selector2;
    this.properties = properties;
  }
}
class ComputedClass extends CustomType {
  constructor(class_def, medias_def, selectors_def, name) {
    super();
    this.class_def = class_def;
    this.medias_def = medias_def;
    this.selectors_def = selectors_def;
    this.name = name;
  }
}
function persistent() {
  return new PersistentCache(new$$1(), 0);
}
function ephemeral() {
  return new EphemeralCache(new$$1());
}
function compute_property(indent$1, key, value2, important) {
  let base_indent = indent(indent$1);
  let important_ = (() => {
    if (important) {
      return " !important";
    } else {
      return "";
    }
  })();
  return base_indent + key + ": " + value2 + important_ + ";";
}
function init_computed_properties(indent2) {
  return new ComputedProperties(toList([]), toList([]), toList([]), indent2);
}
function merge_computed_properties(target, argument) {
  return new ComputedProperties(
    append$2(argument.properties, target.properties),
    append$2(argument.medias, target.medias),
    append$2(argument.pseudo_selectors, target.pseudo_selectors),
    target.indent
  );
}
function handle_property(props, style2) {
  if (!(style2 instanceof Property)) {
    throw makeError(
      "let_assert",
      "sketch/internals/style",
      133,
      "handle_property",
      "Pattern match failed, no pattern matched the value.",
      { value: style2 }
    );
  }
  let key = style2.key;
  let value2 = style2.value;
  let important = style2.important;
  let css_property = compute_property(props.indent, key, value2, important);
  let properties = prepend$1(css_property, props.properties);
  return props.withFields({ properties });
}
function wrap_pseudo_selectors(id, indent2, pseudo_selectors) {
  return map$1(
    pseudo_selectors,
    (p) => {
      return wrap_class(
        id,
        p.properties,
        indent2,
        new Some(p.pseudo_selector)
      );
    }
  );
}
function compute_classes(class_name2, computed_properties) {
  let properties = computed_properties.properties;
  let medias = computed_properties.medias;
  let pseudo_selectors = computed_properties.pseudo_selectors;
  let class_def = wrap_class(
    class_name2,
    properties,
    0,
    new None()
  );
  let medias_def = map$1(
    medias,
    (_use0) => {
      let query = _use0.query;
      let properties$1 = _use0.properties;
      let pseudo_selectors$1 = _use0.pseudo_selectors;
      let selectors_def2 = wrap_pseudo_selectors(
        class_name2,
        2,
        pseudo_selectors$1
      );
      let _pipe = toList([
        query + " {",
        wrap_class(class_name2, properties$1, 2, new None())
      ]);
      let _pipe$1 = ((_capture) => {
        return prepend(toList([selectors_def2, toList(["}"])]), _capture);
      })(_pipe);
      let _pipe$2 = flatten(_pipe$1);
      return join(_pipe$2, "\n");
    }
  );
  let selectors_def = wrap_pseudo_selectors(class_name2, 0, pseudo_selectors);
  let name = class_name2;
  return new ComputedClass(class_def, medias_def, selectors_def, name);
}
function class$$1(styles) {
  let string_representation = inspect(styles);
  return new Class(string_representation, styles);
}
function render_cache_dict(cache2) {
  let _pipe = values(cache2);
  let _pipe$1 = flat_map(
    _pipe,
    (c) => {
      return definitions(c[0]);
    }
  );
  return join(_pipe$1, "\n\n");
}
function render$1(cache2) {
  if (cache2 instanceof EphemeralCache) {
    let cache$1 = cache2.cache;
    return render_cache_dict(cache$1);
  } else {
    let cache$1 = cache2.cache;
    return render_cache_dict(cache$1);
  }
}
function handle_media(cache2, props, style2) {
  if (!(style2 instanceof Media)) {
    throw makeError(
      "let_assert",
      "sketch/internals/style",
      140,
      "handle_media",
      "Pattern match failed, no pattern matched the value.",
      { value: style2 }
    );
  }
  let query = style2.query;
  let styles = style2.styles;
  let $ = compute_properties(cache2, styles, props.indent + 2);
  let cache$1 = $[0];
  let computed_props = $[1];
  let _pipe = new MediaProperty(
    query,
    computed_props.properties,
    computed_props.pseudo_selectors
  );
  let _pipe$1 = ((_capture) => {
    return prepend(props.medias, _capture);
  })(
    _pipe
  );
  let _pipe$2 = ((m) => {
    return props.withFields({ medias: m });
  })(_pipe$1);
  return ((_capture) => {
    return new$(cache$1, _capture);
  })(_pipe$2);
}
function compute_properties(cache2, properties, indent2) {
  let init2 = init_computed_properties(indent2);
  return fold(
    reverse(properties),
    [cache2, init2],
    (_use0, prop) => {
      let cache$1 = _use0[0];
      let acc = _use0[1];
      if (prop instanceof NoStyle) {
        return [cache$1, acc];
      } else if (prop instanceof Property) {
        return [cache$1, handle_property(acc, prop)];
      } else if (prop instanceof Media) {
        return handle_media(cache$1, acc, prop);
      } else if (prop instanceof PseudoSelector) {
        return handle_pseudo_selector(cache$1, acc, prop);
      } else {
        let class$1 = prop.class_name;
        let $ = get$1(cache$1.cache, class$1.string_representation);
        if ($.isOk()) {
          let props = $[0][1];
          return [cache$1, merge_computed_properties(acc, props)];
        } else {
          let _pipe = compute_properties(cache$1, class$1.content, indent2);
          return map_second(
            _pipe,
            (_capture) => {
              return merge_computed_properties(acc, _capture);
            }
          );
        }
      }
    }
  );
}
function handle_pseudo_selector(cache2, props, style2) {
  if (!(style2 instanceof PseudoSelector)) {
    throw makeError(
      "let_assert",
      "sketch/internals/style",
      154,
      "handle_pseudo_selector",
      "Pattern match failed, no pattern matched the value.",
      { value: style2 }
    );
  }
  let pseudo_selector2 = style2.pseudo_selector;
  let styles = style2.styles;
  let $ = compute_properties(cache2, styles, props.indent + 2);
  let cache$1 = $[0];
  let computed_props = $[1];
  let _pipe = new PseudoProperty(pseudo_selector2, computed_props.properties);
  let _pipe$1 = ((_capture) => {
    return prepend(computed_props.pseudo_selectors, _capture);
  })(_pipe);
  let _pipe$2 = append$2(_pipe$1, props.pseudo_selectors);
  let _pipe$3 = ((p) => {
    return props.withFields({ pseudo_selectors: p });
  })(
    _pipe$2
  );
  return ((_capture) => {
    return new$(cache$1, _capture);
  })(_pipe$3);
}
function compute_class(cache2, class$2) {
  let string_representation = class$2.string_representation;
  let content = class$2.content;
  let $ = compute_properties(cache2, content, 2);
  let cache$1 = $[0];
  let properties = $[1];
  let class_id = (() => {
    if (cache$1 instanceof EphemeralCache) {
      return xxHash32(string_representation);
    } else {
      let cid = cache$1.current_id;
      return cid;
    }
  })();
  let class_name$12 = "css-" + to_string$2(class_id);
  let _pipe = compute_classes(class_name$12, properties);
  let _pipe$1 = ((c) => {
    return create(
      c.name,
      class_id,
      new None(),
      new Definitions(c.medias_def, c.selectors_def, c.class_def)
    );
  })(_pipe);
  return ((class$3) => {
    let c = insert(
      cache$1.cache,
      string_representation,
      [class$3, properties]
    );
    let _pipe$2 = (() => {
      if (cache$1 instanceof EphemeralCache) {
        return new EphemeralCache(c);
      } else {
        return new PersistentCache(c, class_id + 1);
      }
    })();
    return new$(_pipe$2, class$3);
  })(_pipe$1);
}
function class_name$1(class$2, cache2) {
  let s = class$2.string_representation;
  let c = class$2.content;
  return guard(
    is_empty(c),
    [cache2, ""],
    () => {
      let $ = get$1(cache2.cache, s);
      if ($.isOk()) {
        let content = $[0][0];
        return [cache2, class_name$2(content)];
      } else {
        let _pipe = compute_class(cache2, class$2);
        return map_second(_pipe, class_name$2);
      }
    }
  );
}
class Px extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Pt extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Vh extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Vw extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Em extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Rem extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Lh extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Rlh extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class Pct extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
function percent(value2) {
  return new Pct(to_float(value2));
}
function rem(value2) {
  return new Rem(value2);
}
function to_string(size) {
  if (size instanceof Px) {
    let value2 = size[0];
    return append(to_string$3(value2), "px");
  } else if (size instanceof Pt) {
    let value2 = size[0];
    return append(to_string$3(value2), "pt");
  } else if (size instanceof Pct) {
    let value2 = size[0];
    return append(to_string$3(value2), "%");
  } else if (size instanceof Vh) {
    let value2 = size[0];
    return append(to_string$3(value2), "vh");
  } else if (size instanceof Vw) {
    let value2 = size[0];
    return append(to_string$3(value2), "vw");
  } else if (size instanceof Em) {
    let value2 = size[0];
    return append(to_string$3(value2), "em");
  } else if (size instanceof Rem) {
    let value2 = size[0];
    return append(to_string$3(value2), "rem");
  } else if (size instanceof Lh) {
    let value2 = size[0];
    return append(to_string$3(value2), "lh");
  } else if (size instanceof Rlh) {
    let value2 = size[0];
    return append(to_string$3(value2), "rlh");
  } else {
    let value2 = size[0];
    return append(to_string$3(value2), "ch");
  }
}
class JsCache extends CustomType {
  constructor(cache2) {
    super();
    this.cache = cache2;
  }
}
class Ephemeral extends CustomType {
}
function class$(styles) {
  return class$$1(styles);
}
function render(cache2) {
  if (!(cache2 instanceof JsCache)) {
    throw makeError(
      "let_assert",
      "sketch",
      38,
      "render",
      "Pattern match failed, no pattern matched the value.",
      { value: cache2 }
    );
  }
  let cache$1 = cache2.cache;
  return render$1(cache$1);
}
function class_name(class$2, cache2) {
  if (!(cache2 instanceof JsCache)) {
    throw makeError(
      "let_assert",
      "sketch",
      53,
      "class_name",
      "Pattern match failed, no pattern matched the value.",
      { value: cache2 }
    );
  }
  let c = cache2.cache;
  let _pipe = class_name$1(class$2, c);
  return map_first(_pipe, (var0) => {
    return new JsCache(var0);
  });
}
function cache(strategy) {
  return new Ok(
    (() => {
      if (strategy instanceof Ephemeral) {
        return new JsCache(ephemeral());
      } else {
        return new JsCache(persistent());
      }
    })()
  );
}
function property(field2, content) {
  return new Property(field2, content, false);
}
function align_items(align) {
  return property("align-items", align);
}
function background_color(value2) {
  return property("background-color", value2);
}
function border(border2) {
  return property("border", border2);
}
function border_radius(border_radius2) {
  return property("border-radius", to_string(border_radius2));
}
function box_shadow(box_shadow2) {
  return property("box-shadow", box_shadow2);
}
function color(color2) {
  return property("color", color2);
}
function cursor(cursor2) {
  return property("cursor", cursor2);
}
function display(display2) {
  return property("display", display2);
}
function flex_direction(flex_direction2) {
  return property("flex-direction", flex_direction2);
}
function flex_shrink(flex_shrink2) {
  return property("flex-shrink", to_string$3(flex_shrink2));
}
function font_size(font_size2) {
  return property("font-size", to_string(font_size2));
}
function font_weight(font_weight2) {
  return property("font-weight", font_weight2);
}
function gap(gap2) {
  return property("gap", to_string(gap2));
}
function justify_content(justify) {
  return property("justify-content", justify);
}
function letter_spacing(letter_spacing2) {
  return property("letter-spacing", letter_spacing2);
}
function line_height(line_height2) {
  return property("line-height", line_height2);
}
function margin_(margin) {
  return property("margin", margin);
}
function max_width(width2) {
  return property("max-width", to_string(width2));
}
function outline(outline2) {
  return property("outline", outline2);
}
function overflow(overflow2) {
  return property("overflow", overflow2);
}
function overflow_x(overflow_x2) {
  return property("overflow-x", overflow_x2);
}
function padding(padding2) {
  return property("padding", to_string(padding2));
}
function padding_(padding2) {
  return property("padding", padding2);
}
function text_align(text_align2) {
  return property("text-align", text_align2);
}
function text_overflow(text_overflow2) {
  return property("text-overflow", text_overflow2);
}
function text_transform(text_transform2) {
  return property("text-transform", text_transform2);
}
function transform(transform2) {
  return property("transform", transform2);
}
function transition(transition2) {
  return property("transition", transition2);
}
function white_space(white_space2) {
  return property("white-space", white_space2);
}
function width(width2) {
  return property("width", to_string(width2));
}
function pseudo_selector(value2, styles) {
  return new PseudoSelector(value2, styles);
}
function hover(styles) {
  return pseudo_selector(":hover", styles);
}
function focus(styles) {
  return pseudo_selector(":focus", styles);
}
function wrap(current) {
  if (isPersistent(current)) return { current };
  return current;
}
function set(variable, newValue) {
  if (!("current" in variable)) return newValue;
  variable.current = newValue;
  return variable;
}
function get(variable) {
  if ("current" in variable) return variable.current;
  return variable;
}
function isPersistent(cache2) {
  return "cache" in cache2 && "current_id" in cache2.cache;
}
function createCssStyleSheet(root) {
  const stylesheet = new CSSStyleSheet();
  if (root && root.adoptedStyleSheets) {
    root.adoptedStyleSheets.push(stylesheet);
  } else {
    document.adoptedStyleSheets.push(stylesheet);
  }
  return stylesheet;
}
function setStylesheet(content, stylesheet) {
  stylesheet.replaceSync(content);
}
class Nothing extends CustomType {
}
class Text2 extends CustomType {
  constructor(content) {
    super();
    this.content = content;
  }
}
let Map$1 = class Map2 extends CustomType {
  constructor(subtree) {
    super();
    this.subtree = subtree;
  }
};
class Element2 extends CustomType {
  constructor(key, namespace, tag, class$2, attributes, children2) {
    super();
    this.key = key;
    this.namespace = namespace;
    this.tag = tag;
    this.class = class$2;
    this.attributes = attributes;
    this.children = children2;
  }
}
function text$1(content) {
  return new Text2(content);
}
function element(tag, class$2, attributes, children2) {
  let class$1 = new Some(class$2);
  return new Element2("", "", tag, class$1, attributes, children2);
}
function fragment(children2) {
  let attrs = toList([style(toList([["display", "contents"]]))]);
  return new Element2(
    "",
    "",
    "lustre-fragment",
    new None(),
    attrs,
    children2
  );
}
function unstyled_children(cache2, children2) {
  return fold(
    reverse(children2),
    [cache2, toList([])],
    (acc, child) => {
      let cache$1 = acc[0];
      let children$1 = acc[1];
      let $ = unstyled(cache$1, child);
      let cache$2 = $[0];
      let child$1 = $[1];
      return [cache$2, prepend$1(child$1, children$1)];
    }
  );
}
function unstyled(loop$cache, loop$element) {
  while (true) {
    let cache2 = loop$cache;
    let element2 = loop$element;
    if (element2 instanceof Nothing) {
      return [cache2, none()];
    } else if (element2 instanceof Text2) {
      let content = element2.content;
      return [cache2, text$2(content)];
    } else if (element2 instanceof Map$1) {
      let subtree = element2.subtree;
      loop$cache = cache2;
      loop$element = subtree();
    } else {
      let key = element2.key;
      let namespace = element2.namespace;
      let tag = element2.tag;
      let class$2 = element2.class;
      let attributes = element2.attributes;
      let children2 = element2.children;
      let class$1 = map$2(
        class$2,
        (_capture) => {
          return class_name(_capture, cache2);
        }
      );
      let class_name$12 = map$2(class$1, second);
      let cache$1 = (() => {
        let _pipe = map$2(class$1, first);
        return unwrap(_pipe, cache2);
      })();
      let $ = unstyled_children(cache$1, children2);
      let cache$2 = $[0];
      let children$1 = $[1];
      let attributes$1 = (() => {
        if (class_name$12 instanceof None) {
          return attributes;
        } else {
          let class_name$1$1 = class_name$12[0];
          let class_name$22 = class$$2(class_name$1$1);
          return prepend$1(class_name$22, attributes);
        }
      })();
      return [
        cache$2,
        (() => {
          let $1 = element$1(tag, attributes$1, children$1);
          if ($1 instanceof Element$1) {
            let t = $1.tag;
            let a = $1.attrs;
            let c = $1.children;
            let s = $1.self_closing;
            let v = $1.void;
            return new Element$1(key, namespace, t, a, c, s, v);
          } else {
            let e = $1;
            return e;
          }
        })()
      ];
    }
  }
}
let Node$1 = class Node2 extends CustomType {
};
class Document extends CustomType {
}
class Options extends CustomType {
  constructor(stylesheet) {
    super();
    this.stylesheet = stylesheet;
  }
}
class CssStyleSheet extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class NodeStyleSheet extends CustomType {
}
function to_stylesheet(options) {
  if (options instanceof Options && options.stylesheet instanceof Node$1) {
    return new NodeStyleSheet();
  } else if (options instanceof Options && options.stylesheet instanceof Document) {
    return new CssStyleSheet(createCssStyleSheet());
  } else {
    let root = options.stylesheet.root;
    return new CssStyleSheet(createCssStyleSheet(root));
  }
}
function render_stylesheet(content, node2, stylesheet) {
  if (stylesheet instanceof NodeStyleSheet) {
    if (node2 instanceof Element$1 && node2.tag === "lustre-fragment") {
      let children2 = node2.children;
      return fragment$1(
        prepend$1(
          element$1("style", toList([]), toList([text$2(content)])),
          children2
        )
      );
    } else {
      return fragment$1(
        toList([
          element$1("style", toList([]), toList([text$2(content)])),
          node2
        ])
      );
    }
  } else {
    let stylesheet$1 = stylesheet[0];
    setStylesheet(content, stylesheet$1);
    return node2;
  }
}
function compose(options, view2, cache2) {
  let cache$1 = wrap(cache2);
  let stylesheet = to_stylesheet(options);
  return (model) => {
    let node$1 = view2(model);
    let $ = unstyled(get(cache$1), node$1);
    let result = $[0];
    let node$2 = $[1];
    let content = render(result);
    set(cache$1, result);
    return render_stylesheet(content, node$2, stylesheet);
  };
}
function node() {
  return new Options(new Node$1());
}
function text(content) {
  return text$1(content);
}
function button(class$2, attributes, children2) {
  return element("button", class$2, attributes, children2);
}
function div(class$2, attributes, children2) {
  return element("div", class$2, attributes, children2);
}
function input(class$2, attributes) {
  return element("input", class$2, attributes, toList([]));
}
function read_local_storage(key) {
  const value2 = window.localStorage.getItem(key);
  let string2 = JSON.parse(value2);
  console.log(string2);
  return string2 ? new Ok(string2) : new Error2(void 0);
}
function write_local_storage(key, value2) {
  const value22 = JSON.stringify(value2);
  window.localStorage.setItem(key, value22);
}
class Model extends CustomType {
  constructor(to_do, in_progress, done, new_task_input) {
    super();
    this.to_do = to_do;
    this.in_progress = in_progress;
    this.done = done;
    this.new_task_input = new_task_input;
  }
}
class UpdateNewTask extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class AddTask extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
class DeleteTask extends CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}
class CacheUpdatedMessage extends CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
function read_localstorage(key) {
  return from(
    (dispatch) => {
      let _pipe = read_local_storage(key);
      let _pipe$1 = new CacheUpdatedMessage(_pipe);
      return dispatch(_pipe$1);
    }
  );
}
function write_localstorage(key, value2) {
  return from((_) => {
    return write_local_storage(key, value2);
  });
}
function init(_) {
  return [
    new Model(
      new Some(toList([])),
      new Some(toList([])),
      new Some(toList([])),
      ""
    ),
    read_localstorage("kanban")
  ];
}
function update(model, msg) {
  if (msg instanceof CacheUpdatedMessage && msg[0].isOk()) {
    let kanban = msg[0][0];
    return [
      model.withFields({
        to_do: new Some(
          (() => {
            let _pipe = kanban;
            let _pipe$1 = index$1(_pipe, 0);
            let _pipe$2 = lazy_unwrap(
              _pipe$1,
              () => {
                return toArray(toList([]));
              }
            );
            return to_list(_pipe$2);
          })()
        ),
        in_progress: new Some(
          (() => {
            let _pipe = kanban;
            let _pipe$1 = index$1(_pipe, 1);
            let _pipe$2 = lazy_unwrap(
              _pipe$1,
              () => {
                return toArray(toList([]));
              }
            );
            return to_list(_pipe$2);
          })()
        ),
        done: new Some(
          (() => {
            let _pipe = kanban;
            let _pipe$1 = index$1(_pipe, 2);
            let _pipe$2 = lazy_unwrap(
              _pipe$1,
              () => {
                return toArray(toList([]));
              }
            );
            return to_list(_pipe$2);
          })()
        )
      }),
      none$1()
    ];
  } else if (msg instanceof CacheUpdatedMessage && !msg[0].isOk()) {
    return [model, none$1()];
  } else if (msg instanceof UpdateNewTask) {
    let value2 = msg[0];
    return [model.withFields({ new_task_input: value2 }), none$1()];
  } else if (msg instanceof DeleteTask) {
    let kanban_block$1 = msg[0];
    let task$1 = msg[1];
    if (kanban_block$1 === "todo") {
      let tasks = (() => {
        let _pipe = model.to_do;
        let _pipe$1 = lazy_unwrap$1(_pipe, () => {
          return toList([]);
        });
        return filter(_pipe$1, (t) => {
          return t !== task$1;
        });
      })();
      let added_tasks = (() => {
        let _pipe = toList([new Some(tasks), model.in_progress, model.done]);
        let _pipe$1 = map$1(
          _pipe,
          (x) => {
            let _pipe$12 = lazy_unwrap$1(x, () => {
              return toList([""]);
            });
            return toArray(_pipe$12);
          }
        );
        return toArray(_pipe$1);
      })();
      return [
        model.withFields({ to_do: new Some(tasks) }),
        write_localstorage("kanban", added_tasks)
      ];
    } else if (kanban_block$1 === "in_progress") {
      let tasks = (() => {
        let _pipe = model.in_progress;
        let _pipe$1 = lazy_unwrap$1(_pipe, () => {
          return toList([]);
        });
        return filter(_pipe$1, (t) => {
          return t !== task$1;
        });
      })();
      let added_tasks = (() => {
        let _pipe = toList([model.to_do, new Some(tasks), model.done]);
        let _pipe$1 = map$1(
          _pipe,
          (x) => {
            let _pipe$12 = lazy_unwrap$1(x, () => {
              return toList([""]);
            });
            return toArray(_pipe$12);
          }
        );
        return toArray(_pipe$1);
      })();
      return [
        model.withFields({ in_progress: new Some(tasks) }),
        write_localstorage("in_progress", added_tasks)
      ];
    } else if (kanban_block$1 === "done") {
      let tasks = (() => {
        let _pipe = model.done;
        let _pipe$1 = lazy_unwrap$1(_pipe, () => {
          return toList([]);
        });
        return filter(_pipe$1, (t) => {
          return t !== task$1;
        });
      })();
      let added_tasks = (() => {
        let _pipe = toList([model.to_do, model.in_progress, new Some(tasks)]);
        let _pipe$1 = map$1(
          _pipe,
          (x) => {
            let _pipe$12 = lazy_unwrap$1(x, () => {
              return toList([""]);
            });
            return toArray(_pipe$12);
          }
        );
        return toArray(_pipe$1);
      })();
      return [
        model.withFields({ done: new Some(tasks) }),
        write_localstorage("done", added_tasks)
      ];
    } else {
      return [model, none$1()];
    }
  } else {
    let kanban_block$1 = msg[0];
    if (kanban_block$1 === "todo") {
      let $ = model.new_task_input;
      if ($ === "") {
        return [model, none$1()];
      } else {
        let t = $;
        return [
          model.withFields({
            to_do: new Some(
              prepend$1(
                t,
                (() => {
                  let _pipe = model.to_do;
                  return lazy_unwrap$1(
                    _pipe,
                    () => {
                      return toList([]);
                    }
                  );
                })()
              )
            ),
            new_task_input: ""
          }),
          write_localstorage(
            "kanban",
            (() => {
              let _pipe = toList([
                new Some(
                  prepend$1(
                    t,
                    (() => {
                      let _pipe2 = model.to_do;
                      return lazy_unwrap$1(
                        _pipe2,
                        () => {
                          return toList([]);
                        }
                      );
                    })()
                  )
                ),
                model.in_progress,
                model.done
              ]);
              let _pipe$1 = map$1(
                _pipe,
                (x) => {
                  let _pipe$12 = lazy_unwrap$1(
                    x,
                    () => {
                      return toList([""]);
                    }
                  );
                  return toArray(_pipe$12);
                }
              );
              return toArray(_pipe$1);
            })()
          )
        ];
      }
    } else if (kanban_block$1 === "in_progress") {
      let $ = model.new_task_input;
      if ($ === "") {
        return [model, none$1()];
      } else {
        let t = $;
        return [
          model.withFields({
            in_progress: new Some(
              prepend$1(
                t,
                (() => {
                  let _pipe = model.in_progress;
                  return lazy_unwrap$1(
                    _pipe,
                    () => {
                      return toList([]);
                    }
                  );
                })()
              )
            ),
            new_task_input: ""
          }),
          write_localstorage(
            "kanban",
            (() => {
              let _pipe = toList([
                model.to_do,
                new Some(
                  prepend$1(
                    t,
                    (() => {
                      let _pipe2 = model.in_progress;
                      return lazy_unwrap$1(
                        _pipe2,
                        () => {
                          return toList([]);
                        }
                      );
                    })()
                  )
                ),
                model.done
              ]);
              let _pipe$1 = map$1(
                _pipe,
                (x) => {
                  let _pipe$12 = lazy_unwrap$1(
                    x,
                    () => {
                      return toList([""]);
                    }
                  );
                  return toArray(_pipe$12);
                }
              );
              return toArray(_pipe$1);
            })()
          )
        ];
      }
    } else if (kanban_block$1 === "done") {
      let $ = model.new_task_input;
      if ($ === "") {
        return [model, none$1()];
      } else {
        let t = $;
        return [
          model.withFields({
            done: new Some(
              prepend$1(
                t,
                (() => {
                  let _pipe = model.done;
                  return lazy_unwrap$1(
                    _pipe,
                    () => {
                      return toList([]);
                    }
                  );
                })()
              )
            ),
            new_task_input: ""
          }),
          write_localstorage(
            "kanban",
            (() => {
              let _pipe = toList([
                model.to_do,
                model.in_progress,
                new Some(
                  prepend$1(
                    t,
                    (() => {
                      let _pipe2 = model.done;
                      return lazy_unwrap$1(
                        _pipe2,
                        () => {
                          return toList([]);
                        }
                      );
                    })()
                  )
                )
              ]);
              let _pipe$1 = map$1(
                _pipe,
                (x) => {
                  let _pipe$12 = lazy_unwrap$1(
                    x,
                    () => {
                      return toList([""]);
                    }
                  );
                  return toArray(_pipe$12);
                }
              );
              return toArray(_pipe$1);
            })()
          )
        ];
      }
    } else {
      return [model, none$1()];
    }
  }
}
function block_title() {
  return class$(
    toList([
      font_size(rem(2)),
      font_weight("bold"),
      margin_("0 0 1.5rem 0"),
      color("#F7F7F7"),
      text_align("center"),
      text_transform("uppercase"),
      letter_spacing("0.1rem")
    ])
  );
}
function container() {
  return class$(
    toList([
      display("flex"),
      flex_direction("column"),
      align_items("center"),
      margin_("auto"),
      padding(rem(2)),
      width(percent(90)),
      max_width(rem(80)),
      background_color("#001524"),
      border_radius(rem(1)),
      box_shadow("0 8px 16px rgba(0, 0, 0, 0.1)")
    ])
  );
}
function kanban_board_container() {
  return class$(
    toList([
      overflow_x("auto"),
      white_space("nowrap"),
      padding(rem(1.5)),
      width(percent(100))
    ])
  );
}
function kanban_board() {
  return class$(
    toList([
      display("flex"),
      flex_direction("row"),
      gap(rem(2.5))
    ])
  );
}
function kanban_block() {
  return class$(
    toList([
      background_color("#2A3D45"),
      padding(rem(2)),
      width(rem(22)),
      flex_shrink(0),
      border_radius(rem(0.8)),
      box_shadow("0 4px 8px rgba(0,0,0,0.1)"),
      display("flex"),
      flex_direction("column"),
      gap(rem(1.5)),
      hover(toList([box_shadow("0 6px 12px rgba(0,0,0,0.15)")]))
    ])
  );
}
function task() {
  return class$(
    toList([
      text_align("center"),
      font_size(rem(1.5)),
      background_color("#F7F7F7"),
      border("0.1rem solid #ddd"),
      border_radius(rem(0.4)),
      padding(rem(1)),
      margin_("0.5rem 0"),
      box_shadow("0 1px 3px rgba(0,0,0,0.1)"),
      transition("transform 0.2s ease, box-shadow 0.2s ease"),
      hover(
        toList([
          transform("scale(1.02)"),
          box_shadow("0 6px 12px rgba(0,0,0,0.2)")
        ])
      ),
      overflow("hidden"),
      text_overflow("ellipsis"),
      white_space("normal"),
      line_height("1.8rem")
    ])
  );
}
function add_task_input() {
  return class$(
    toList([
      background_color("#F7F7F7"),
      border("0.1rem solid #ccc"),
      border_radius(rem(0.4)),
      padding(rem(0.8)),
      margin_("0.5rem 0"),
      box_shadow("0 1px 3px rgba(0,0,0,0.1)"),
      font_size(rem(1.5))
    ])
  );
}
function add_task_button() {
  return class$(
    toList([
      background_color("#4B8F6A"),
      font_size(rem(1.5)),
      color("#fff"),
      border("none"),
      border_radius(rem(0.4)),
      padding(rem(0.8)),
      margin_("0.5rem 0"),
      text_align("center"),
      font_weight("bold"),
      cursor("pointer"),
      transition("transform 0.2s ease, background-color 0.2s ease"),
      hover(
        toList([
          background_color("#4B8F8C"),
          transform("scale(1.05)")
        ])
      )
    ])
  );
}
function delete_task_button() {
  return class$(
    toList([
      display("inline-flex"),
      align_items("center"),
      justify_content("center"),
      background_color("transparent"),
      color("#FF5C5C"),
      border("0.1rem solid #FF5C5C"),
      border_radius(rem(0.5)),
      padding_("0.3rem 0.6rem"),
      margin_("0 0 0 0.5rem"),
      cursor("pointer"),
      font_size(rem(1)),
      font_weight("bold"),
      transition(
        "background-color 0.3s ease, color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease"
      ),
      box_shadow("0 2px 4px rgba(0, 0, 0, 0.1)"),
      hover(
        toList([
          background_color("#FF5C5C"),
          color("#FFFFFF"),
          box_shadow("0 4px 8px rgba(0, 0, 0, 0.2)"),
          transform("scale(1.1)")
        ])
      ),
      focus(
        toList([
          outline("none"),
          box_shadow("0 0 0 0.2rem rgba(255, 92, 92, 0.5)")
        ])
      )
    ])
  );
}
function view(model) {
  return div(
    container(),
    toList([]),
    toList([
      div(
        kanban_board_container(),
        toList([]),
        toList([
          div(
            kanban_board(),
            toList([]),
            toList([
              div(
                kanban_block(),
                toList([]),
                toList([
                  div(
                    block_title(),
                    toList([]),
                    toList([text("To Do")])
                  ),
                  input(
                    add_task_input(),
                    toList([
                      type_("text"),
                      value$1(model.new_task_input),
                      on_input(
                        (var0) => {
                          return new UpdateNewTask(var0);
                        }
                      )
                    ])
                  ),
                  button(
                    add_task_button(),
                    toList([on_click(new AddTask("todo"))]),
                    toList([text("Add Task")])
                  ),
                  fragment(
                    (() => {
                      let _pipe = model.to_do;
                      let _pipe$1 = lazy_unwrap$1(
                        _pipe,
                        () => {
                          return toList([]);
                        }
                      );
                      return map$1(
                        _pipe$1,
                        (task_item) => {
                          return div(
                            task(),
                            toList([]),
                            toList([
                              text(task_item),
                              button(
                                delete_task_button(),
                                toList([
                                  on_click(
                                    new DeleteTask("todo", task_item)
                                  )
                                ]),
                                toList([text("X")])
                              )
                            ])
                          );
                        }
                      );
                    })()
                  )
                ])
              ),
              div(
                kanban_block(),
                toList([]),
                toList([
                  div(
                    block_title(),
                    toList([]),
                    toList([text("In Progress")])
                  ),
                  input(
                    add_task_input(),
                    toList([
                      type_("text"),
                      value$1(model.new_task_input),
                      on_input(
                        (var0) => {
                          return new UpdateNewTask(var0);
                        }
                      )
                    ])
                  ),
                  button(
                    add_task_button(),
                    toList([on_click(new AddTask("in_progress"))]),
                    toList([text("Add Task")])
                  ),
                  fragment(
                    (() => {
                      let _pipe = model.in_progress;
                      let _pipe$1 = lazy_unwrap$1(
                        _pipe,
                        () => {
                          return toList([]);
                        }
                      );
                      return map$1(
                        _pipe$1,
                        (task_item) => {
                          return div(
                            task(),
                            toList([]),
                            toList([
                              text(task_item),
                              button(
                                delete_task_button(),
                                toList([
                                  on_click(
                                    new DeleteTask("in_progress", task_item)
                                  )
                                ]),
                                toList([text("X")])
                              )
                            ])
                          );
                        }
                      );
                    })()
                  )
                ])
              ),
              div(
                kanban_block(),
                toList([]),
                toList([
                  div(
                    block_title(),
                    toList([]),
                    toList([text("Done")])
                  ),
                  input(
                    add_task_input(),
                    toList([
                      type_("text"),
                      value$1(model.new_task_input),
                      on_input(
                        (var0) => {
                          return new UpdateNewTask(var0);
                        }
                      )
                    ])
                  ),
                  button(
                    add_task_button(),
                    toList([on_click(new AddTask("done"))]),
                    toList([text("Add Task")])
                  ),
                  fragment(
                    (() => {
                      let _pipe = model.done;
                      let _pipe$1 = lazy_unwrap$1(
                        _pipe,
                        () => {
                          return toList([]);
                        }
                      );
                      return map$1(
                        _pipe$1,
                        (task_item) => {
                          return div(
                            task(),
                            toList([]),
                            toList([
                              text(task_item),
                              button(
                                delete_task_button(),
                                toList([
                                  on_click(
                                    new DeleteTask("done", task_item)
                                  )
                                ]),
                                toList([text("X")])
                              )
                            ])
                          );
                        }
                      );
                    })()
                  )
                ])
              )
            ])
          )
        ])
      )
    ])
  );
}
function main() {
  let $ = cache(new Ephemeral());
  if (!$.isOk()) {
    throw makeError(
      "let_assert",
      "kemotvt",
      19,
      "main",
      "Pattern match failed, no pattern matched the value.",
      { value: $ }
    );
  }
  let cache$1 = $[0];
  let _pipe = node();
  let _pipe$1 = compose(_pipe, view, cache$1);
  let _pipe$2 = ((_capture) => {
    return application(init, update, _capture);
  })(_pipe$1);
  return start(_pipe$2, "#app", void 0);
}
document.addEventListener("DOMContentLoaded", () => {
  main();
});
