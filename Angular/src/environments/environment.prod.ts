console.log((<any>window).env.API_URL);

export const environment = {
  production: true,
  apiUrl: (<any>window).env.API_URL
};