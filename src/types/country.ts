export interface Country {
    name?:         Name;
    tld?:          string[];
    cca2?:         string;
    ccn3?:         string;
    cioc?:         string;
    independent?:  boolean;
    status?:       Status;
    unMember?:     boolean;
    currencies?:   { [key: string]: Currency };
    idd?:          Idd;
    capital?:      string[];
    altSpellings?: string[];
    region?:       Region;
    subregion?:    string;
    languages?:    { [key: string]: string };
    latlng?:       number[];
    landlocked?:   boolean;
    borders?:      string[];
    area?:         number;
    demonyms?:     Demonyms;
    cca3?:         string;
    translations?: { [key: string]: Translation };
    flag?:         string;
    maps?:         Maps;
    population?:   number;
    gini?:         { [key: string]: number };
    fifa?:         string;
    car?:          Car;
    timezones?:    string[];
    continents?:   Region[];
    flags?:        Flags;
    coatOfArms?:   CoatOfArms;
    startOfWeek?:  StartOfWeek;
    capitalInfo?:  CapitalInfo;
    postalCode?:   PostalCode;
}

export interface CapitalInfo {
    latlng?: number[];
}

export interface Car {
    signs?: string[];
    side?:  Side;
}

export type Side = "right" | "left";

export interface CoatOfArms {
    png?: string;
    svg?: string;
}

export type Region = "Asia" | "Oceania" | "Africa" | "North America" | "Europe" | "South America" | "Americas";

export interface Currency {
    symbol?: string;
    name?:   string;
}

export interface Demonyms {
    eng?: Eng;
    fra?: Eng;
}

export interface Eng {
    f?: string;
    m?: string;
}

export interface Flags {
    png?: string;
    svg?: string;
    alt?: string;
}

export interface Idd {
    root?:     string;
    suffixes?: string[];
}

export interface Maps {
    googleMaps?:     string;
    openStreetMaps?: string;
}

export interface Name {
    common?:     string;
    official?:   string;
    nativeName?: { [key: string]: Translation };
}

export interface Translation {
    official?: string;
    common?:   string;
}

export interface PostalCode {
    format?: null | string;
    regex?:  null | string;
}

export type StartOfWeek = "monday" | "sunday" | "saturday";

export type Status = "officially-assigned" | "user-assigned";
