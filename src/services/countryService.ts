import { endpoints } from "../utils/constants";
import { apiClient } from "./apiClient";

export const getAllCountries = () => apiClient(endpoints.all);