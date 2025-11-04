import type { Country } from "../types/country";
import { BASE_URL, endpoints } from "../utils/constants";

export const apiClient = async <T = Country[]>(endpoint: string): Promise<T> => {
    const response = await fetch(`${BASE_URL}${endpoint}`);
    if (!response.ok) throw new Error("API Error");
    return (await response.json()) as T;
}
